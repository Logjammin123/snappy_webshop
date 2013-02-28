class CreateDiscountGroups < ActiveRecord::Migration
  def change
    create_table :discount_groups do |t|
      t.string :name
      t.integer :discount

      t.timestamps
    end
  end
end
