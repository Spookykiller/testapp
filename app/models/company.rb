class Company < ActiveRecord::Base
    has_many :users
    has_many :clients
    has_many :projects
    has_many :spendings
    
    validates :company_name, presence: true
    validates :company_address, presence: true
    validates :company_zipcode, presence: true
    validates :company_place, presence: true
    validates :company_phone, presence: true, length: {maximum: 10}
    validates :company_email, presence: true
    validates :company_webaddress, presence: true
    validates :company_bank_account_number, presence: true
    validates :company_bank, presence: true
    validates :company_VAT_number, presence: true
    validates :company_CC_number, presence: true

end
