class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.integer :company_number
      t.string :company_name
      t.string :company_address
      t.string :company_zipcode
      t.string :company_place
      t.string :company_phone
      t.string :company_email
      t.string :company_webaddress
      t.string :company_bank_account_number
      t.string :company_bank
      t.string :company_VAT_number
      t.string :company_CC_number
      t.string :company_kilometer_compensation

      t.timestamps null: false
    end
  end
end
