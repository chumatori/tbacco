class User < ApplicationRecord
  def self.recovery_password
  end

  validates :email, :password, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  has_many :posts
end