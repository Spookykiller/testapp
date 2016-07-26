class Article < ActiveRecord::Base
    validates :article_code, presence: true, uniqueness: true
    validates :article_unit, presence: true
    validates :article_unit_price, presence: true
end
