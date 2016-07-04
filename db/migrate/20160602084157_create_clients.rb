class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.integer :client_number
      t.string :client_name
      t.string :client_contact_person
      t.string :client_address
      t.string :client_zipcode
      t.string :client_residence
      t.boolean :client_gender
      t.string :client_phone
      t.string :client_email
      t.string :client_account_number

      t.timestamps null: false
    end
  end
end
