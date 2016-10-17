class AddCompanyLogoToCompanies < ActiveRecord::Migration
  def change
    add_attachment :companies, :company_logo
  end
end