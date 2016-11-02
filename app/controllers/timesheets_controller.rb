class TimesheetsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_timesheet, only: [:edit, :update, :destroy]
    
    def index
        @timesheets = Timesheet.all
    end
    
    def new
        @timesheet = Timesheet.new
    end
    
    def create
        @timesheet = Timesheet.new timesheet_params
        
        if @timesheet.save
            flash[:notice] = "De urenregistratie is opgeslagen!"
            redirect_to action: "index"
        else
            render 'new'
            flash[:notice] = "Oh nee! De urenregistratie is niet opgeslagen."
        end
    end
    
    def edit
    end
    
    def update
        if @timesheet.update timesheet_params
            flash[:notice] = "Uw urenregistratie is succesvol aangepast."
            redirect_to action: "index"
        else
            flash[:notice] = "Oh nee! Uw urenregistratie is niet opgeslagen."
            render 'edit'
        end
    end
    
    def destroy
        @timesheet.destroy
        redirect_to action: "index"
    end
    
    private
    
    def timesheet_params
        params.require(:timesheet).permit(:timesheet_project_number, :timesheet_name, :timesheet_description, :timesheet_date, :timesheet_hours, :timesheet_billable, :timesheet_comment)
    end
    
    def find_timesheet
       @timesheet = Timesheet.find(params[:id]) 
    end
end
