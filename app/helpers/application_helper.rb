module ApplicationHelper
  
  #=======================PRIVATE METHODS=========================
  private
  #=============================================================== 
  
  def calculate_taxes(income, filing_category)
    # puts filing_category.standard_deduction
    taxable_income = income - filing_category.standard_deduction
    taxable_income = 0 if (taxable_income < 0) # In case income is less than std. deduction
    
    # Init stuff
    income_tax = 0
    prev_bracket = Hash.new
    tax_brackets = Array.new
    
    # Loop through the brackets and create a new hash with the information.
    filing_category.tax_rates.each_with_index do |cat,index|
      
      # Assign hash elements for this bracket
      tax_bracket = Hash.new
      tax_bracket["lower_limit"] = (cat.lower_limit > 0) ? cat.lower_limit : 1            
      tax_bracket["upper_limit"] = nil
      tax_bracket["marginal_rate"] = cat.marginal_rate
      tax_bracket["calc_tax"] = 0
      
      # We now have the upper limit for the previous bracket, so do some calcs
      if index > 0
        prev_bracket["upper_limit"] = cat.lower_limit - 1
        # Calculate tax in the previous bracket
        prev_bracket["calc_tax"] = tax_in_bracket(taxable_income, 
                                                  prev_bracket["lower_limit"], 
                                                  prev_bracket["upper_limit"], 
                                                  prev_bracket["marginal_rate"] )
        income_tax += prev_bracket["calc_tax"]
        tax_brackets << prev_bracket # Append to array
      end
      prev_bracket = tax_bracket
    end
    # Generate the last (upper) bracket
    prev_bracket["calc_tax"] =  tax_in_bracket(taxable_income,
                                               prev_bracket["lower_limit"],
                                               prev_bracket["upper_limit"],
                                               prev_bracket["marginal_rate"])
    prev_bracket["upper_limit"] = taxable_income if (taxable_income >= prev_bracket["lower_limit"] )
    tax_brackets << prev_bracket
    income_tax += prev_bracket["calc_tax"]
    
    return income_tax, tax_brackets
  end
  
  def calculate_oasdi_tax(income, payroll_rates)
    oasdi_tax = ([income, payroll_rates.oasdi_upper_limit].min) * payroll_rates.oasdi_rate / 100
  end
  
  def calculate_hi_tax(income, payroll_rates)
    oasdi_tax = income * payroll_rates.hi_rate / 100
  end
  
  def tax_in_bracket(income,lower,upper,rate)
    upper = income + 1 if upper.nil?
    
    tax = 0 if income <= lower
    tax = (([income, upper].min - lower) + 1 ) * rate * 0.01 if income > lower
    return tax
  end
  
end
