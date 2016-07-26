class AnnualaccountsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_annualaccount, only: [:show, :edit, :update, :destroy]

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
        params.require(:annualaccount).permit(:an_date, :an_pr_depreciation, :an_pr_interest)
    end
    
    def find_annualaccount
       @annualaccount = Annualaccount.find(params[:id]) 
    end
end
