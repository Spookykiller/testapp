class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
  end
  
  def dashboard
    @projects = Project.all
  end
  
  def vat_declaration
  end
end
