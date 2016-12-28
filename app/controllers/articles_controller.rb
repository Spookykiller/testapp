class ArticlesController < ApplicationController
    before_action :authenticate_user!
    before_action :find_article, only: [:edit, :update, :destroy]
    helper_method :sort_column, :sort_direction
    
    def index
        @articles = Article.order(sort_column + " " + sort_direction)
    end
    
    def new
        @article = Article.new
    end
    
    def create
        @article = Article.new article_params
        
        if @article.save
            flash[:notice] = "Het artikel is opgeslagen!"
            redirect_to action: "index"
        else
            render 'new'
            flash[:notice] = "Oh nee! Het artikel is niet opgeslagen."
        end
    end
    
    def edit
    end
    
    def update
        if @article.update article_params
            flash[:notice] = "Uw artikel informatie is succesvol aangepast."
            redirect_to action: "index"
        else
            flash[:notice] = "Oh nee! Uw artikel informatie kon niet opgeslagen worden."
            render 'edit'
        end
    end
    
    def destroy
        @article.destroy
        redirect_to action: "index"
    end
    
    private
    
    def article_params
        params.require(:article).permit(:article_code, :article_description, :article_unit, :article_VAT_percentage, :article_unit_price)
    end
    
    def find_article
        @article = Article.find(params[:id]) 
    end
    
    def sort_column
        Article.column_names.include?(params[:sort]) ? params[:sort] : "article_code"
    end
    
    def sort_direction
        %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
