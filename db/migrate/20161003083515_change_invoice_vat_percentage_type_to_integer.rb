class ChangeInvoiceVatPercentageTypeToInteger < ActiveRecord::Migration
  def change
    change_column :items, :item_VAT_percentage, :integer
  end
end
