class CreateTaxRates < ActiveRecord::Migration
  def self.up
    create_table :tax_rates do |t|
      # Full (4-digit) year that these tax rates are valid for
      t.integer :year
      # Single, Married (joint), Married (separate), Head of Household etc
      t.integer :filing_category_id
      # Marginal tax rate
      t.float :marginal_rate
      
      # Limits that this marginal rate is valid for
      t.decimal :lower_limit

      t.timestamps
    end
    
    create_table  :fica_tax_rates do |t|
      t.integer :year
      t.float :oasdi_rate
      t.float :oasdi_upper_limit
      
      t.float :hi_rate
    end
    
    create_table  :seca_tax_rates do |t|
      t.integer :year
      t.float :oasdi_rate
      t.float :oasdi_upper_limit
      
      t.float :hi_rate
    end
    
  end

  def self.down
    drop_table :seca_tax_rates
    drop_table :fica_tax_rates
    
    drop_table :tax_rates
  end
end
