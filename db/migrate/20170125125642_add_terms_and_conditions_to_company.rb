class AddTermsAndConditionsToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :terms_and_conditions, :text
    add_column :companies, :payment_time, :integer
    remove_column :companies, :payment_terms
  end
end
