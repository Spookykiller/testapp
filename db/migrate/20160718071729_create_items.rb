class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :item_code
      t.string :item_description
      t.string :item_unit
      t.decimal :item_quantity
      t.decimal :item_unit_cost
      t.decimal :item_VAT_percentage
      t.decimal :item_total_price
      t.belongs_to :invoice, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
