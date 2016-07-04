class AnnualaccountsController < ApplicationController
    before_action :find_annualaccount, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!

    def index
        @annualaccounts = Annualaccount.all
    end
    
    def new
        @annualaccount = Annualaccount.new
    end
    
    def show
    end
    
    def create
        @annualaccount = Annualaccount.new annualaccount_params
        
        if @annualaccount.save
            flash[:notice] = "De klant is opgeslagen!"
            redirect_to action: "index"
        else
            render 'new'
            flash[:notice] = "Oh nee! De klant is niet opgeslagen."
        end
    end
    
    def edit
    end
    
    def update
        if @annualaccount.update annualaccount_params
            flash[:notice] = "Uw klanteninfo is succesvol aangepast."
            redirect_to action: "index"
        else
            flash[:notice] = "Oh nee! Uw klanteninfo kon niet opgeslagen worden."
            render 'edit'
        end
    end
    
    def destroy
        @annualaccount.destroy
        redirect_to action: "index"
    end
    
    private
    
    def annualaccount_params
        params.require(:annualaccount).permit(:an_date, :an_pr_return, :an_pr_production_cost, :an_pr_gross_margin, :an_pr_TA_expenses, :an_pr_accomodation_expenses, :an_pr_sales_expenses, :an_pr_consumption_expenses, :an_pr_other_expenses, :an_pr_total_other_expenses, :an_pr_net_margin, :an_pr_depreciation, :an_pr_bank_charges, :an_pr_small_business_scheme, :an_pr_loss, :an_pr_withdrawal, :an_pr_deposit, :an_pr_balance_turnover_tax, :an_pr_payed_turnover_tax, :an_pr_deductible_consumption_expenses, :an_ba_debtor, :an_ba_liquid_assets, :an_ba_prepayment, :an_ba_stock, :an_ba_carrying_amount, :an_ba_total_asset, :an_ba_creditors, :an_ba_accrued_receivables, :an_ba_current_receivables, :an_ba_loan, :an_ba_pr_balance, :an_ba_withdrawals_deposits_balance, :an_ba_reserve, :an_ba_total_receivables)
    end
    
    def find_annualaccount
       @annualaccount = Annualaccount.find(params[:id]) 
    end
end
