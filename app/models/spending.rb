class Spending < ActiveRecord::Base
    belongs_to :company
    before_save :calculate_spending_including_VAT, :calculate_spending_VAT_percentage, :define_spending_left
    after_create :define_spending_follow_number
    
    validates :spending_date, presence: true
    validates :spending_company_name, presence: true
    validates :spending_cost_description, presence: true
    validates :spending_type, presence: true
    validates :spending_exclusive_VAT, presence: true
    validates :spending_VAT, presence: true
    validate :is_paid?
    
    private
    
    def is_paid?
        if self.spending_paid.blank? && !self.spending_when_paid.blank?
            errors.add(:spending_paid, 'Betaald bedrag moet ook ingevuld worden als betaald datum ingevuld is!')
        elsif !self.spending_paid.blank? && self.spending_when_paid.blank?
            errors.add(:spending_paid, 'Betaal datum moet ook ingevuld worden als betaald bedrag ingevuld is!')
        end
    end
    
    def calculate_spending_including_VAT
        self.spending_including_VAT = self.spending_exclusive_VAT + self.spending_VAT
    end
    
    def calculate_spending_VAT_percentage
        self.spending_VAT_percentage = (self.spending_VAT / self.spending_exclusive_VAT) * 100
        self.spending_VAT_percentage.round(1)
    end
    
    def define_spending_follow_number
        self.update_attributes(:spending_follow_number => (self.id + (Time.now.year * 1000)))
    end
    
    def define_spending_left
        if !self.spending_paid.blank?
            self.spending_left = (self.spending_including_VAT - self.spending_paid)
        else
            self.spending_left = 0
        end
    end
end
