class AddMoreDetailedSpecificationsToClients < ActiveRecord::Migration
  def change
    remove_column :clients, :client_name
    remove_column :clients, :client_address
    add_column :clients, :client_first_name, :string
    add_column :clients, :client_last_name, :string
    add_column :clients, :client_street, :string
    add_column :clients, :client_street_number, :integer 
    add_column :clients, :client_street_addition, :string
  end
end
