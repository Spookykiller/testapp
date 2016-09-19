class ChangeSpendingInvoiceNumberToString < ActiveRecord::Migration
  def change
    change_column :spendings, :spending_invoice_number_creditor, :string
  end
end
