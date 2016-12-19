class Company < ActiveRecord::Base
    has_many :users
    has_many :clients
    has_many :projects
    has_many :spendings
    before_save :strip_blank_spaces
    
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
    validates :company_kilometer_compensation, presence: true
    validates :administration_code, presence: true
    
    has_attached_file :company_logo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :company_logo, content_type: /\Aimage\/.*\z/
    validates_attachment :company_logo, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
    
    def strip_blank_spaces
        self.company_name = self.company_name.strip
        self.company_address = self.company_address.strip
        self.company_zipcode = self.company_zipcode.strip
        self.company_phone = self.company_email.strip
        self.company_email = self.company_email.strip
        self.company_webaddress = self.company_webaddress.strip
        
        self.company_bank_account_number = self.company_bank_account_number.strip
        self.company_bank = self.company_bank.strip
        self.company_VAT_number = self.company_VAT_number.strip
        self.company_CC_number = self.company_CC_number.strip
        self.company_kilometer_compensation = self.company_kilometer_compensation.strip
        
        self.company_place = self.company_place.strip.upcase
    end
end
