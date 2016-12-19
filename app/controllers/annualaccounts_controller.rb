class AnnualaccountsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_annualaccount, only: [:show, :edit, :update, :destroy]

    def index
        @annualaccounts = Annualaccount.all.order('an_date DESC')
    end
    
    def new
        @annualaccount = Annualaccount.new
    end
    
    def show
        @inkoop = Spending.where("spending_type = 'Inkoop' AND extract(year from spending_when_paid) = ?", @annualaccount.an_date.year)
        @personeelskosten = Spending.where("spending_type = 'Personeelskosten' AND extract(year from spending_when_paid) = ?", @annualaccount.an_date.year)
        @Huisvestigingskosten = Spending.where("spending_type = 'Huisvestigingskosten' AND extract(year from spending_when_paid) = ?", @annualaccount.an_date.year)
        @verkoopkosten = Spending.where("spending_type = 'Verkoopkosten' AND extract(year from spending_when_paid) = ?", @annualaccount.an_date.year)
        @consumptiekosten = Spending.where("spending_type = 'Consumptiekosten' AND extract(year from spending_when_paid) = ?", @annualaccount.an_date.year)
        @reisverblijfskosten = Spending.where("spending_type = 'Reis- en verblijfkosten' AND extract(year from spending_when_paid) = ?", @annualaccount.an_date.year)
        @autokosten = Spending.where("spending_type = 'Autokosten' AND extract(year from spending_when_paid) = ?", @annualaccount.an_date.year)
        @kantoorkosten = Spending.where("spending_type = 'Kantoorkosten' AND extract(year from spending_when_paid) = ?", @annualaccount.an_date.year)
        @overigekosten = Spending.where("spending_type = 'Overige kosten' AND extract(year from spending_when_paid) = ?", @annualaccount.an_date.year)
        
        @invoice = Invoice.where("invoice_paid IS NOT NULL AND extract(year from invoice_when_paid) = ?", @annualaccount.an_date.year)
        @mileage = Mileage.where("extract(year from mileage_date) = ?", @annualaccount.an_date.year)
    end
    
    def create
        @annualaccount = Annualaccount.new annualaccount_params
        
        if @annualaccount.save
            flash[:notice] = "De jaarrekening is opgeslagen!"
            redirect_to action: "index"
        else
            render 'new'
            flash[:notice] = "Oh nee! De jaarrekening is niet opgeslagen."
        end
    end
    
    def edit
    end
    
    def update
        if @annualaccount.update annualaccount_params
            flash[:notice] = "Uw jaarrekening is succesvol aangepast."
            redirect_to action: "index"
        else
            flash[:notice] = "Oh nee! Uw jaarrekening kon niet opgeslagen worden."
            render 'edit'
        end
    end
    
    def destroy
        @annualaccount.destroy
        redirect_to action: "index"
    end
    
    private
    
    def annualaccount_params
        params.require(:annualaccount).permit(:an_date, :an_pr_depreciation, :an_pr_interest)
    end
    
    def find_annualaccount
       @annualaccount = Annualaccount.find(params[:id]) 
    end
end
