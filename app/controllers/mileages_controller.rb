class MileagesController < ApplicationController
    before_action :authenticate_user!
    before_action :find_mileage, only: [:edit, :update, :destroy]
    helper_method :sort_column, :sort_direction

    def index
        @mileages = Mileage.order(sort_column + " " + sort_direction)
    end
    
    def new
        @mileage = Mileage.new
    end
    
    def create
        @mileage = Mileage.new mileage_params
        
        if @mileage.save
            flash[:notice] = "De kilometerregistratie is opgeslagen!"
            redirect_to action: "index"
        else
            render 'new'
            flash[:notice] = "Oh nee! De kilometerregistratie is niet opgeslagen."
        end
    end
    
    def edit
    end
    
    def update
        if @mileage.update mileage_params
            flash[:notice] = "Uw kilometerregistratie is succesvol aangepast."
            redirect_to action: "index"
        else
            flash[:notice] = "Oh nee! Uw kilometerregistratie kon niet opgeslagen worden."
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
    
    def sort_column
        Mileage.column_names.include?(params[:sort]) ? params[:sort] : "mileage_date"
    end
    
    def sort_direction
        %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
