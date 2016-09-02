class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :update_access_token!  

  validates :email, presence: true
  validates :password, presence: true

   def update_access_token!
    token = "#{self.created_at.strftime('%Y%m%d%H%M%S')}:#{Devise.friendly_token}:#{self.id}"
    self.access_token = token
    save
  end
end
