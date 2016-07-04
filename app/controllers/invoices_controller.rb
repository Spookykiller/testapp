class InvoicesController < ApplicationController
    before_action :find_invoice, only: [:test, :edit, :update, :destroy]
    before_action :authenticate_user!
    
    def index
        @invoices = Invoice.all
    end
    
    def earning
       @invoices = Invoice.all 
    end

    def new
        @invoice = Invoice.new
    end
    
    def test
        @invoice.update_attributes(:invoice_VAT_number => 1000 )
    end
    
    def create
        @invoice = Invoice.new invoice_params
        
        if @invoice.save
            flash[:notice] = "De factuur is opgeslagen!"
            redirect_to action: "index"
        else
            render 'new'
            flash[:notice] = "Oh nee! De factuur is niet opgeslagen."
        end
    end
    
    def edit
    end
    
    def update
        if @invoice.update invoice_params
            flash[:notice] = "Uw factuurinfo is succesvol aangepast."
            redirect_to action: "index"
        else
            flash[:notice] = "Oh nee! Uw factuurinfo kon niet opgeslagen worden."
            render 'edit'
        end
    end
    
    def destroy
        @invoice.destroy
        redirect_to action: "index"
    end
    
    private
    
    def invoice_params
        params.require(:invoice).permit(:invoice_number, :invoice_date, :invoice_client_name, :invoice_subject, :invoice_VAT_number, :invoice_VAT_percentage, :invoice_exclusive_VAT, :invoice_VAT, :invoice_including_VAT, :invoice_when_paid, :invoice_paid, :invoice_left)
    end
    
    def find_invoice
       @invoice = Invoice.find(params[:id]) 
    end
end
