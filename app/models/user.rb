class User < ApplicationRecord
  has_secure_password

  validates_uniqueness_of :email
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_presence_of :name, :email, :password, :password_confirmation
end
