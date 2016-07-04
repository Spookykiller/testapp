class CreateAnnualaccounts < ActiveRecord::Migration
  def change
    create_table :annualaccounts do |t|
      t.datetime :an_date
      t.decimal :an_pr_return
      t.decimal :an_pr_purchase_value
      t.decimal :an_pr_gross_margin
      t.decimal :an_pr_accomodation_expenses
      t.decimal :an_pr_TA_expenses
      t.decimal :an_pr_consumption_expenses
      t.decimal :an_pr_sales_expenses
      t.decimal :an_pr_car_expenses
      t.decimal :an_pr_office_expenses
      t.decimal :an_pr_other_expenses
      t.decimal :an_pr_total_company_expenses
      t.decimal :an_pr_company_result
      t.decimal :an_pr_depreciation
      t.decimal :an_pr_interest

      t.timestamps null: false
    end
  end
end
