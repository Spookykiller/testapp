class PagesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_invoices, only: [:vat_declaration]

  def home
  end
  
  def dashboard
    @projects = Project.all
    @invoices = Invoice.where("invoice_definitive = true AND invoice_left > 0").order("created_at DESC")
    @spending = Spending.where("spending_left > 0").order("created_at DESC")
  end
  
  def vat_declaration
  end
  
  private
  
  def find_invoices
    @invoices = Invoice.where(:invoice_definitive => true)
    @spendings = Spending.all
  end
end
