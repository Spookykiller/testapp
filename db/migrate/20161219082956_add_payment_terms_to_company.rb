class AddPaymentTermsToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :payment_terms, :text
  end
end
