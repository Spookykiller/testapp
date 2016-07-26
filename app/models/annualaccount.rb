class Annualaccount < ActiveRecord::Base
    validates :an_date, presence: true, uniqueness: true
end
