class SpendingCategory < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  
  has_many :spending_rates
end
