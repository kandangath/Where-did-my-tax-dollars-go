class CreateSpendingRates < ActiveRecord::Migration
  def self.up
    create_table :spending_rates do |t|
      # Parent category (can be null)
      t.integer :spending_category_id
      
      t.string :name, :null => false, :default => ""
      t.text :description, :default => ""
      
      # 4 digit year that this spending rate is applicable for
      t.integer :year, :null => false
      
      # actual amount in millions of dollars
      t.float :amount, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :spending_rates
  end
end
