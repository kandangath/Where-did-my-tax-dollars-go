class CreateFilingCategories < ActiveRecord::Migration
  def self.up
    create_table :filing_categories do |t|
      # Filing category for Taxes (Single, Married, Married (separate), Head of Household etc)
      t.string :name
      t.text :description
      # Standard Deduction ($) for this category
      t.integer :standard_deduction

      t.timestamps
    end
  end

  def self.down
    drop_table :filing_categories
  end
end
