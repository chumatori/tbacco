class Article < ApplicationRecord
  has_one :user
  validates :header, :body, presence: true
  has_many :comment
  
  def archive
  end

  def restore
  end
end