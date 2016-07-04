class CreateSpendings < ActiveRecord::Migration
  def change
    create_table :spendings do |t|
      t.integer :spending_follow_number
      t.datetime :spending_date
      t.string :spending_company_name
      t.string :spending_cost_description
      t.integer :spending_invoice_number_creditor
      t.string :spending_type
      t.decimal :spending_VAT_percentage
      t.decimal :spending_exclusive_VAT
      t.decimal :spending_VAT
      t.decimal :spending_including_VAT
      t.datetime :spending_when_paid
      t.decimal :spending_paid
      t.decimal :spending_left

      t.timestamps null: false
    end
  end
end
