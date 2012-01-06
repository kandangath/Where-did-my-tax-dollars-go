class SpendingRate < ActiveRecord::Base
  
  validates_presence_of :name
  validates_numericality_of :year
  # validates_uniqueness_of :name
  
  belongs_to :spending_category
  
  
  # callback to populate some formula fields for parent
  def after_save
    cat = SpendingCategory.find_by_id(self.spending_category_id)
    
    if ! cat.nil?
      # _sum = SpendingRate.sum(:amount, :conditions => ["spending_category_id = ?", self.spending_category_id])
      # cat.sum_amount = _sum
      #     
      # _sum = SpendingRate.sum(:rate, :conditions => ["spending_category_id = ?", self.spending_category_id])
      # cat.sum_rate = _sum
    
      cat.save! # Update the category
    end
  end
end
