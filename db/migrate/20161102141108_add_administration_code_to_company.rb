class AddAdministrationCodeToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :administration_code, :integer
  end
end
