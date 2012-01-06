class CreateSpendingCategories < ActiveRecord::Migration
  def self.up
    create_table :spending_categories do |t|
      
      t.string :name, :null => false, :default => ""
      t.text  :description, :default => ""
      
      t.timestamps
    end
  end

  def self.down
    drop_table :spending_categories
  end
end
