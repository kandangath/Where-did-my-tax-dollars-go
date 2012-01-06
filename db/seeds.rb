# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

# Start with a clean slate
print "\n\n" + "="*50 + "\nPopulate database with seed data\n" + "="*50 + "\n\n"

#----------------------------------
# SPENDING CATEGORIES
#----------------------------------
print "== Delete Spending Categories and Spending Rates... "
SpendingRate.delete_all
SpendingCategory.delete_all
print "Done.\n"

print "== Create new Spending Categories and Spending Rates... "
file_seed = File.join(Rails.root, 'db', 'seeds', 'us_spending.yml')
seed_data = YAML::load_file(file_seed)

seed_data["spending_rate"].each do |y|
  year = y["year"]
  y["categories"].each do |c|
    cat = SpendingCategory.find_or_create_by_name(c["category"], :description => c["description"])
    if cat.nil?
      puts "ERROR: Could not create spending category - ", c["category"]
    else
      c["spending"].each do |r|
        print "Adding spending: ", r["name"]
        print "\n"
        SpendingRate.create!( :spending_category => cat, 
                              :year => year, 
                              :name => r["name"], 
                              :description => r["description"], 
                              :amount => r["amount"])
      end
    end
  end
end
print "Done.\n"


#----------------------------------
# TAX RATES
#----------------------------------
# Create Tax Filing Catgories
print "== Delete Filing Categories and Tax Rates... "
TaxRate.delete_all
FicaTaxRate.delete_all
SecaTaxRate.delete_all
FilingCategory.delete_all
print "Done.\n"

print "== Create new Filing Categories and Tax Rates... "
file_seed = File.join(Rails.root, 'db', 'seeds', 'us_tax_rates.yml')
seed_data = YAML::load_file(file_seed)

seed_data["tax_rate"].each do |y|
  year = y["year"]
  y["categories"].each do |c|
    cat = FilingCategory.find_or_create_by_name(c["category"], :standard_deduction => c["standard_deduction"])
    if cat.nil?
      puts "ERROR: Could not create filing category - ", c["category"]
    else
      c["rates"].each do |r|
        TaxRate.create!(  :filing_category => cat,
                          :year => year, 
                          :marginal_rate => r["marginal_rate"], 
                          :lower_limit => r["lower_limit"])
      end
    end
  end
end
print "Done.\n"

# FICA Tax
print "== Adding FICA rates... "
seed_data["fica_tax_rate"].each do |y|
  year = y["year"]
  y["rates"].each do |r|
    FicaTaxRate.create!( :year => year, :oasdi_rate => r["oasdi_rate"], :oasdi_upper_limit => r["oasdi_upper_limit"], :hi_rate => r["hi_rate"])
  end
end
print "Done.\n"

# SECA Tax
print "== Adding SECA rates... "
seed_data["seca_tax_rate"].each do |y|
  year = y["year"]
  y["rates"].each do |r|
    SecaTaxRate.create!( :year => year, :oasdi_rate => r["oasdi_rate"], :oasdi_upper_limit => r["oasdi_upper_limit"], :hi_rate => r["hi_rate"])
  end
end
print "Done.\n"

# fcat = FilingCategory.create!(:name => 'Single', :standard_deduction => 5700)
# TaxRate.create!([ {:year => 2009, :marginal_rate => 10, :lower_limit => 0,:filing_category => fcat}
#                 ])
# TaxRate.create!([ {:year => 2009, :marginal_rate => 15, :lower_limit => 8376,:filing_category => fcat}
#                 ])
# TaxRate.create!([ {:year => 2009, :marginal_rate => 25, :lower_limit => 34001,:filing_category => fcat}
#                 ])
# TaxRate.create!([ {:year => 2009, :marginal_rate => 28, :lower_limit => 82401,:filing_category => fcat}
#                 ])
# TaxRate.create!([ {:year => 2009, :marginal_rate => 33, :lower_limit => 171851,:filing_category => fcat}
#                 ])
# TaxRate.create!([ {:year => 2009, :marginal_rate => 35, :lower_limit => 373651,:filing_category => fcat}
#                 ])    
#                                                                             
# fcat = FilingCategory.create!(:name => 'Married (Filing Jointly)', :standard_deduction => 11400)
# TaxRate.create!([ {:year => 2009, :marginal_rate => 10, :lower_limit => 0,:filing_category => fcat}
#                 ])
# TaxRate.create!([ {:year => 2009, :marginal_rate => 15, :lower_limit => 16751,:filing_category => fcat}
#                 ])
# TaxRate.create!([ {:year => 2009, :marginal_rate => 25, :lower_limit => 68001,:filing_category => fcat}
#                 ])
# TaxRate.create!([ {:year => 2009, :marginal_rate => 28, :lower_limit => 137301,:filing_category => fcat}
#                 ])
# TaxRate.create!([ {:year => 2009, :marginal_rate => 33, :lower_limit => 209251,:filing_category => fcat}
#                 ])
# TaxRate.create!([ {:year => 2009, :marginal_rate => 35, :lower_limit => 373651,:filing_category => fcat}
#                 ])
#             
# fcat = FilingCategory.create!(:name => 'Married (Filing Separately)', :standard_deduction => 5700)
# TaxRate.create!([ {:year => 2009, :marginal_rate => 10, :lower_limit => 0,:filing_category => fcat}
#                 ])
# TaxRate.create!([ {:year => 2009, :marginal_rate => 15, :lower_limit => 8376,:filing_category => fcat}
#                 ])
# TaxRate.create!([ {:year => 2009, :marginal_rate => 25, :lower_limit => 34001,:filing_category => fcat}
#                 ])
# TaxRate.create!([ {:year => 2009, :marginal_rate => 28, :lower_limit => 68651,:filing_category => fcat}
#                 ])
# TaxRate.create!([ {:year => 2009, :marginal_rate => 33, :lower_limit => 104626,:filing_category => fcat}
#                 ])
# TaxRate.create!([ {:year => 2009, :marginal_rate => 35, :lower_limit => 186826,:filing_category => fcat}
#                 ])
#                 
# fcat = FilingCategory.create!(:name => 'Qualified Widow(er)', :standard_deduction => 11400)
# TaxRate.create!([ {:year => 2009, :marginal_rate => 10, :lower_limit => 0,:filing_category => fcat}
#                 ])
# TaxRate.create!([ {:year => 2009, :marginal_rate => 15, :lower_limit => 16751,:filing_category => fcat}
#                 ])
# TaxRate.create!([ {:year => 2009, :marginal_rate => 25, :lower_limit => 68001,:filing_category => fcat}
#                 ])
# TaxRate.create!([ {:year => 2009, :marginal_rate => 28, :lower_limit => 137301,:filing_category => fcat}
#                 ])
# TaxRate.create!([ {:year => 2009, :marginal_rate => 33, :lower_limit => 209251,:filing_category => fcat}
#                 ])
# TaxRate.create!([ {:year => 2009, :marginal_rate => 35, :lower_limit => 373651,:filing_category => fcat}
#                 ])
# 
#                 
# fcat = FilingCategory.create!(:name => 'Head of Household', :standard_deduction => 8350)
# TaxRate.create!([ {:year => 2009, :marginal_rate => 10, :lower_limit => 0,:filing_category => fcat}
#                 ])
# TaxRate.create!([ {:year => 2009, :marginal_rate => 15, :lower_limit => 11951,:filing_category => fcat}
#                 ])
# TaxRate.create!([ {:year => 2009, :marginal_rate => 25, :lower_limit => 45551,:filing_category => fcat}
#                 ])
# TaxRate.create!([ {:year => 2009, :marginal_rate => 28, :lower_limit => 117651,:filing_category => fcat}
#                 ])
# TaxRate.create!([ {:year => 2009, :marginal_rate => 33, :lower_limit => 190551,:filing_category => fcat}
#                 ])
# TaxRate.create!([ {:year => 2009, :marginal_rate => 35, :lower_limit => 373651,:filing_category => fcat}
#                 ])

print "\n\n" + "="*50 + "\nSeeding Complete!\n" + "="*50 + "\n\n"

