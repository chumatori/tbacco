class Article < ApplicationRecord
  has_one :user
  validates :header, :body, presence: true
  has_many :comments
  
  def archive
  end

  def restore
  end
end