class Client < ActiveRecord::Base
    belongs_to :company
    has_many :invoices
    has_many :projects
    after_create :define_client_number
        
    validates :client_first_name, presence: true, uniqueness: { scope: [:client_last_name] }
    validates :client_last_name, presence: true, uniqueness: { scope: [:client_first_name] }
    
    validates :client_company_name, uniqueness: true
    
    validates :client_street, presence: true
    validates :client_street_number, presence: true

    validates :client_zipcode, presence: true
    validates :client_residence, presence: true
    
    validates :client_email, presence: true
    
    def define_client_number
        self.update_attributes(:client_number => self.id + ((self.client_number + 100) * 1000))
    end
        
end
