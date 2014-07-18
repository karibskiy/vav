class User < ActiveRecord::Base
	validates :name,  presence: true, length: { maximum: 30 }
  	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  	validates :password, :confirmation => true
 	validates :password_confirmation, :presence => true
end
