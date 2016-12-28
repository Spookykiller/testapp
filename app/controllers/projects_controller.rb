class ProjectsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_project, only: [:edit, :update, :destroy]
    helper_method :sort_column, :sort_direction

    def index
        @projects = Project.order(sort_column + " " + sort_direction)
    end
    
    def new
        @project = Project.new
    end
    
    def create
        @project = Project.new client_params
        
        if @project.save
            flash[:notice] = "Het project is opgeslagen!"
            redirect_to action: "index"
        else
            render 'new'
            flash[:notice] = "Oh nee! Het project is niet opgeslagen."
        end
    end
    
    def edit
    end
    
    def update
        if @project.update client_params
            flash[:notice] = "Uw projectinfo is succesvol aangepast."
            redirect_to action: "index"
        else
            flash[:notice] = "Oh nee! Uw projectinfo kon niet opgeslagen worden."
            render 'edit'
        end
    end
    
    def destroy
        @project.destroy
        redirect_to action: "index"
    end
    
    private
    
    def client_params
        params.require(:project).permit(:project_name, :project_client, :project_budget, :project_hour_rate, :project_billable, :project_non_billable, :project_residual)
    end
    
    def find_project
       @project = Project.find(params[:id]) 
    end
    
    def sort_column
        Project.column_names.include?(params[:sort]) ? params[:sort] : "project_name"
    end
    
    def sort_direction
        %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
