class CompaniesController < ApplicationController
    before_filter :authenticate_user!
    before_action :find_company, only: [:edit, :update]
    
    def edit
        @company = Company.find(params[:id]) 
    end
    
    def update
        if @company.update company_params
            flash[:notice] = "Uw bedrijfsinfo is succesvol aangepast."
            render 'edit'
        else
            flash[:notice] = "Oh nee! Uw bedrijfsinfo kon niet opgeslagen worden."
            render 'edit'
        end
    end
    
    def company_params
        params.require(:company).permit(:company_name, :company_address, :company_zipcode, :company_place, :company_phone, :company_email, :company_webaddress, :company_bank_account_number, :company_bank, :company_VAT_number, :company_CC_number, :company_kilometer_compensation)
    end
    
    def find_company
       @company = Company.find(params[:id]) 
    end
end