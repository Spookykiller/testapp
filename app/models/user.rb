class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable

  belongs_to :company
  
  validates :company_id, presence: true
  validates :user_name, presence: true, uniqueness: true
  validates :user_function, presence: true
  validates :user_phone, presence: true
end
