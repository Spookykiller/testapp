class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
  end
  
  def dashboard
    @projects = Project.all
    @invoices = Invoice.all.order("created_at DESC")
  end
  
  def vat_declaration
  end
end
