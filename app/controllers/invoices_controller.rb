class InvoicesController < ApplicationController
    before_action :authenticate_user!
    before_action :find_invoice, only: [:definitive, :earning_edit, :update_earning, :show, :edit, :update, :destroy]
    helper_method :sort_column, :sort_direction
    
    def index
        @invoices_concept = Invoice.where(:invoice_definitive => nil, :offer => [nil,false]).order(sort_column + " " + sort_direction)
        @invoices_definitive = Invoice.where(:invoice_definitive => true, :offer => [nil,false]).order(sort_column + " " + sort_direction)
    end
    
    def earning
       @invoices = Invoice.all.where(:invoice_definitive => true, :offer => [nil,false]).order('invoice_date DESC')
    end
    
    def earning_edit
    end
    
    def definitive
    end
    
    def offer_index
        @offers = Invoice.all.where(:offer => true).order('invoice_date DESC')
    end
    
    def offer
        @invoice = Invoice.new
    end
    
    def show
    end
    
    def new
        @invoice = Invoice.new
    end
    
    def client_update
        respond_to do |format|               
            format.js
        end
    end
    
    def create
        @invoice = Invoice.new invoice_params
        
        if @invoice.offer == true
            if @invoice.save
                flash[:notice] = "De offerte is opgeslagen!"
                redirect_to action: "offer_index"
            else
                render 'offer'
                flash[:notice] = "Oh nee! De offerte is niet opgeslagen."
            end
        else
            if @invoice.save
                flash[:notice] = "De factuur is opgeslagen!"
                redirect_to action: "index"
                
                # params = {'action' => 'insert', 'administration_number' => current_user.company.administration_code, 'invoice_number' => @invoice.invoice_number, 'invoice_date' => @invoice.invoice_date, 'invoice_client_name' => @invoice.invoice_client_name, 'invoice_client_number' => 100012, 'invoice_subject' => @invoice.invoice_subject, 'invoice_VAT_number' => @invoice.invoice_VAT_number, 'invoice_including_VAT' => @invoice.invoice_including_VAT, 'subtotal_0' => @invoice.subtotal_0, 'subtotal_6' => @invoice.subtotal_6, 'subtotal_21' => @invoice.subtotal_21, 'VAT6' => @invoice.VAT6, 'VAT21' => @invoice.VAT21 }
                
                # x = Net::HTTP.post_form(URI.parse('https://updateconnector-koenders.c9users.io/AFAS-ProfitClass-PHP-master/sample/invoice_AppConnectorUpdate.php'), params)
                # puts x.body
            else
                render 'new'
                flash[:notice] = "Oh nee! De factuur is niet opgeslagen."
            end
        end
    end
    
    def edit
        if @invoice.invoice_definitive == true
            redirect_to action: "show"
        end
    end
    
    def update
    
        if @invoice.offer == true
            if @invoice.update invoice_params
                flash[:notice] = "Uw offerte is succesvol aangepast."
                redirect_to action: "index"
            else
                flash[:notice] = "Oh nee! Uw offerte kon niet opgeslagen worden."
                render 'edit'
            end
        else
            if @invoice.update invoice_params
                flash[:notice] = "Uw factuurinfo is succesvol aangepast."
                redirect_to action: "index"
            else
                flash[:notice] = "Oh nee! Uw factuurinfo kon niet opgeslagen worden."
                render 'edit'
            end 
        end

    end
    
    def update_earning
        if @invoice.update invoice_params
            flash[:notice] = "Uw betaling is succesvol aangepast."
            redirect_to action: "earning"
        else
            flash[:notice] = "Oh nee! Uw betaling kon niet opgeslagen worden."
            render 'earning_edit'
        end
    end
    
    def destroy
        @invoice.destroy
        redirect_to action: "index"
    end
    
    private
    
    def invoice_params
        params.require(:invoice).permit(:invoice_number, :invoice_date, :invoice_client_name, :invoice_subject, :invoice_VAT_number, :invoice_VAT_percentage, :invoice_exclusive_VAT, :invoice_VAT, :invoice_including_VAT, :invoice_when_paid, :invoice_paid, :invoice_left, :invoice_definitive, :VAT6, :VAT21, :offer, items_attributes: [:id, :item_code, :item_description, :item_unit, :item_quantity, :item_unit_cost, :item_VAT_percentage, :item_total_price, :_destroy])
    end
    
    def find_invoice
       @invoice = Invoice.find(params[:id]) 
    end
    
    def sort_column
        Invoice.column_names.include?(params[:sort]) ? params[:sort] : "invoice_number"
    end
    
    def sort_direction
        %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
    
end
