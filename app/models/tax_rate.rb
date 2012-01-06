class TaxRate < ActiveRecord::Base
  validates_numericality_of :year
  
  belongs_to :filing_category
  
end
