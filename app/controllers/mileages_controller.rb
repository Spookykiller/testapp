class MileagesController < ApplicationController
    before_action :find_mileage, only: [:edit, :update, :destroy]
    before_action :authenticate_user!

    def index
        @mileages = Mileage.all
    end
    
    def new
        @mileage = Mileage.new
    end
    
    def create
        @mileage = Mileage.new mileage_params
        
        if @mileage.save
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
        if @mileage.update mileage_params
            flash[:notice] = "Uw klanteninfo is succesvol aangepast."
            redirect_to action: "index"
        else
            flash[:notice] = "Oh nee! Uw klanteninfo kon niet opgeslagen worden."
            render 'edit'
        end
    end
    
    def destroy
        @mileage.destroy
        redirect_to action: "index"
    end
    
    private
    
    def mileage_params
        params.require(:mileage).permit(:mileage_retour, :mileage_date, :mileage_from, :mileage_to, :mileage_kilometers, :mileage_total_kilometers, :mileage_billable, :mileage_compensation_rate, :mileage_compensation)
    end
    
    def find_mileage
       @mileage = Mileage.find(params[:id]) 
    end
end
