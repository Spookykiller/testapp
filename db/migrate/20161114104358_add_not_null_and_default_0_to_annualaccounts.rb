class AddNotNullAndDefault0ToAnnualaccounts < ActiveRecord::Migration
  def change
    remove_column :annualaccounts, :an_pr_interest
    remove_column :annualaccounts, :an_pr_depreciation
    
    remove_column :annualaccounts, :an_pr_return
    remove_column :annualaccounts, :an_pr_purchase_value
    remove_column :annualaccounts, :an_pr_gross_margin
    remove_column :annualaccounts, :an_pr_accomodation_expenses
    remove_column :annualaccounts, :an_pr_TA_expenses
    remove_column :annualaccounts, :an_pr_consumption_expenses
    remove_column :annualaccounts, :an_pr_sales_expenses
    remove_column :annualaccounts, :an_pr_car_expenses
    remove_column :annualaccounts, :an_pr_office_expenses
    remove_column :annualaccounts, :an_pr_other_expenses
    remove_column :annualaccounts, :an_pr_total_company_expenses
    remove_column :annualaccounts, :an_pr_company_result

    add_column :annualaccounts, :an_pr_interest, :decimal, :null => false, :default => 0
    add_column :annualaccounts, :an_pr_depreciation, :decimal, :null => false, :default => 0
  end
end
