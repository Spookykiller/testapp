class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
  end
  
  def dashboard
    @projects = Project.all
    @invoices = Invoice.where("invoice_definitive = true AND invoice_left > 0").order("invoice_number ASC")
    @spending = Spending.where("spending_left > 0").order("spending_date ASC")
  end
  
  def vat_declaration
    @invoices = Invoice.where('invoice_definitive = ? AND extract(year from invoice_date) = ?', true, Time.now.year)
    @spendings = Spending.where('extract(year from spending_date) = ?', Time.now.year)
  end
  
    
  def past_vat_declaration
    @invoices = Invoice.where('invoice_definitive = ? AND extract(year from invoice_date) = ?', true, Time.now.year - 1)
    @spendings = Spending.where('extract(year from spending_date) = ?', Time.now.year)
  end
  
end
