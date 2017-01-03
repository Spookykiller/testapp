class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable

  belongs_to :company
  
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "img.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates_attachment_file_name :avatar, matches: [/png\z/, /jpe?g\z/]
  validates_attachment_size :avatar, :in => 0.megabytes..1.megabytes
  
  validates :company_id, presence: true
  validates :user_name, presence: true, uniqueness: true
  validates :user_function, presence: true
  validates :user_phone, presence: true
  
  def active_for_authentication?
    #remember to call the super
    #then put our own check to determine "active" state using 
    #our own "is_active" column
    super and self.allowed_to_log_in != false
  end
  
  def inactive_message
    "U bent niet toegestaan om in te loggen."
  end
end
