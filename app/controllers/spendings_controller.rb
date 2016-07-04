class SpendingsController < ApplicationController
    before_action :find_spending, only: [:edit, :update, :destroy]
    before_action :authenticate_user!
    
    def index
        @spendings = Spending.all
    end
    
    def new
        @spending = Spending.new
    end
    
    def create
        @spending = Spending.new spending_params
        
        if @spending.save
            flash[:notice] = "De uitgave is opgeslagen!"
            redirect_to action: "index"
        else
            render 'new'
            flash[:notice] = "Oh nee! De uitgave is niet opgeslagen."
        end
    end
    
    def edit
    end
    
    def update
        if @spending.update spending_params
            flash[:notice] = "Uw uitgave is succesvol aangepast."
            redirect_to action: "index"
        else
            flash[:notice] = "Oh nee! Uw uitgave kon niet opgeslagen worden."
            render 'edit'
        end
    end
    
    def destroy
        @spending.destroy
        redirect_to action: "index"
    end
    
    private
    
    def spending_params
        params.require(:spending).permit(:spending_follow_number, :spending_date, :spending_company_name, :spending_cost_description, :spending_invoice_number_creditor, :spending_type, :spending_VAT_percentage, :spending_exclusive_VAT, :spending_VAT, :spending_including_VAT, :spending_when_paid, :spending_paid, :spending_left)
    end
    
    def find_spending
       @spending = Spending.find(params[:id]) 
    end
end
