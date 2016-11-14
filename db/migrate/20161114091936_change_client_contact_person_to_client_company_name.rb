class ChangeClientContactPersonToClientCompanyName < ActiveRecord::Migration
  def change
    remove_column :clients, :client_contact_person
    add_column :clients, :client_company_name, :string
  end
end
