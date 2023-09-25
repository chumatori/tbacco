class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  has_many :articles

  def self.system_user
    where(kind: :system_user).first_or_create
  end
end