class AddOfferToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :offer, :boolean
  end
end
