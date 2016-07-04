class Client < ActiveRecord::Base
    belongs_to :company
    has_many :invoices
    has_many :projects
    
    validates :client_number, presence: true
    validates :client_name, presence: true
    validates :client_contact_person, presence: true, uniqueness: true
    validates :client_address, presence: true, uniqueness: true
    validates :client_zipcode, presence: true, uniqueness: true
    validates :client_residence, presence: true
    validates :client_gender, presence: true
    validates :client_phone, presence: true
    validates :client_email, presence: true
    validates :client_account_number, presence: true, uniqueness: true

end
