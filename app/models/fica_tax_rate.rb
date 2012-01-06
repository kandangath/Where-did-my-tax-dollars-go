class FicaTaxRate < ActiveRecord::Base
  validates_presence_of :year
  validates_numericality_of :year
    
end
