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

  def pitiful?
    return false if Reaction.exists?(article_id: id)
    2.minutes.ago > created_at
  end
end