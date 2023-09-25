class Article < ApplicationRecord
  belongs_to :user
  validates :header, :body, presence: true
  has_many :comments
  has_many :reaction

  def ban!
    update(banned_at: Time.now)
  end

  def banned?
    !banned_at.nil?
  end
end