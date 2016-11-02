class ClientsController < ApplicationController
    require "uri"
    require "net/http"
    before_action :authenticate_user!
    before_action :find_client, only: [:edit, :update, :destroy]

    def index
        @clients = Client.all
    end
    
    def new
        @client = Client.new
    end
    
    def create
        @client = Client.new client_params
        
        if @client.save
            flash[:notice] = "De klant is opgeslagen!"
            
            # params = {'action' => 'insert', 'client_number' => (@client.client_number + 100000), 'client_name' => @client.client_name, 'client_address' => @client.client_address, 'client_zipcode' => @client.client_zipcode, 'client_residence' => @client.client_residence, 'client_phone' => @client.client_phone, 'client_mobile' => @client.client_phone, 'client_email' => @client.client_email }
            
            # x = Net::HTTP.post_form(URI.parse('https://updateconnector-koenders.c9users.io/AFAS-ProfitClass-PHP-master/sample/client_AppConnectorUpdate.php'), params)
            # puts x.body
            
            redirect_to action: "index"
        else
            render 'new'
            flash[:notice] = "Oh nee! De klant is niet opgeslagen."
        end
    end
    
    def edit
    end
    
    def update
        if @client.update client_params
            flash[:notice] = "Uw klanteninfo is succesvol aangepast."
            
            # params = {'action' => 'update', 'client_number' => (@client.client_number + 100000), 'client_name' => @client.client_name, 'client_address' => @client.client_address, 'client_zipcode' => @client.client_zipcode, 'client_residence' => @client.client_residence, 'client_phone' => @client.client_phone, 'client_mobile' => @client.client_phone, 'client_email' => @client.client_email }
            
            # x = Net::HTTP.post_form(URI.parse('https://updateconnector-koenders.c9users.io/AFAS-ProfitClass-PHP-master/sample/client_AppConnectorUpdate.php'), params)
            # puts x.body
            
            redirect_to action: "index"
            
        else
            flash[:notice] = "Oh nee! Uw klanteninfo kon niet opgeslagen worden."
            render 'edit'
        end
    end
    
    def destroy
        @client.destroy
        redirect_to action: "index"
    end
    
    private
    
    def client_params
        params.require(:client).permit(:client_number, :client_name, :client_contact_person, :client_address, :client_zipcode, :client_residence, :client_gender, :client_phone, :client_email, :client_account_number)
    end
    
    def find_client
       @client = Client.find(params[:id]) 
    end
end
