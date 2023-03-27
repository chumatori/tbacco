class User < ApplicationRecord
  validates :email, :password, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  has_many :post
end