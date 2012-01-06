class FilingCategory < ActiveRecord::Base
  
  validates_presence_of :name
  
  has_many :tax_rates, :order => 'lower_limit ASC'
end
