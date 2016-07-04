class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :invoice_number
      t.datetime :invoice_date
      t.string :invoice_client_name
      t.string :invoice_subject
      t.string :invoice_VAT_number
      t.integer :invoice_VAT_percentage
      t.decimal :invoice_exclusive_VAT
      t.decimal :invoice_VAT
      t.decimal :invoice_including_VAT
      t.datetime :invoice_when_paid
      t.decimal :invoice_paid
      t.decimal :invoice_left
      
      t.timestamps null: false
    end
  end
end
