class Spending < ActiveRecord::Base
    belongs_to :company
    
    validates :spending_date, presence: true
    validates :spending_company_name, presence: true
    validates :spending_cost_description, presence: true
    validates :spending_type, presence: true
    validates :spending_exclusive_VAT, presence: true
    validates :spending_VAT, presence: true
end
