class Invoice < ActiveRecord::Base
    belongs_to :client
    has_many :items
    
    accepts_nested_attributes_for :items, reject_if: :all_blank, allow_destroy: true

    validates :invoice_date, presence: true
    validates :invoice_client_name, presence: true
    validates :invoice_subject, presence: true
    validates :invoice_VAT_number, presence: true

end
