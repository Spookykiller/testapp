class AddVat6ToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :VAT6, :decimal
    add_column :invoices, :VAT21, :decimal
  end
end
