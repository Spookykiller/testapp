class ClientsController < ApplicationController
    before_action :find_client, only: [:edit, :update, :destroy]
    before_action :authenticate_user!

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
