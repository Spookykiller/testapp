class AddSubtotalFieldsToInvoice < ActiveRecord::Migration
  def change
    add_column :invoices, :subtotal_0, :decimal
    add_column :invoices, :subtotal_6, :decimal
    add_column :invoices, :subtotal_21, :decimal
  end
end
