class Article < ApplicationRecord
  belongs_to :user
  validates :header, :body, presence: true
  has_many :comments, dependent: :destroy
  has_many :reaction, dependent: :destroy

  scope :pity, -> { where("articles.created_at < ?", Time.now - 10.seconds).includes(:reaction).where(reactions: {id: nil})}

  def ban!
    update(banned_at: Time.now)
  end

  def banned?
    !banned_at.nil?
  end
end