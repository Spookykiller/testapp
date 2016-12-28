class TimesheetsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_timesheet, only: [:edit, :update, :destroy]
    helper_method :sort_column, :sort_direction 
    
    def index
        @timesheets = Timesheet.order(sort_column + " " + sort_direction)
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
    
    def sort_column
        Timesheet.column_names.include?(params[:sort]) ? params[:sort] : "timesheet_project_number"
    end
    
    def sort_direction
        %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
