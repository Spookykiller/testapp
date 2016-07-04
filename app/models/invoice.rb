class Invoice < ActiveRecord::Base
    belongs_to :client

    validates :invoice_date, presence: true
    validates :invoice_client_name, presence: true
    validates :invoice_subject, presence: true
    validates :invoice_VAT_number, presence: true


end
