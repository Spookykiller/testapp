class Invoice < ActiveRecord::Base
    belongs_to :client
    has_many :items, dependent: :destroy
    before_save :set_invoice_left
    after_create :define_invoice_number
    
    accepts_nested_attributes_for :items, reject_if: :all_blank, allow_destroy: true

    validates :invoice_date, presence: true
    validates :invoice_client_name, presence: true
    validates :invoice_subject, presence: true
    validates :invoice_exclusive_VAT, presence: true
    validates :invoice_VAT, presence: true
    validates :invoice_including_VAT, presence: true
    validates :VAT6, presence: true
    validates :VAT21, presence: true
    
    
    private
            
    def set_invoice_left
        if self.invoice_paid.present? && self.invoice_including_VAT.present? && self.invoice_paid > 0
            self.invoice_left = self.invoice_including_VAT - self.invoice_paid
        end
    end
    
    def define_invoice_number
        self.update_attributes(:invoice_number => (self.id + (Time.now.year * 1000)))
    end
end
