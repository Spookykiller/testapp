class Mileage < ActiveRecord::Base
    validates :mileage_date, presence: true
    validates :mileage_from, presence: true
    validates :mileage_to, presence: true
    validates :mileage_kilometers, presence: true
end
