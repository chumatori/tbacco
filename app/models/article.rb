class Article < ApplicationRecord
  belongs_to :user
  validates :header, :body, presence: true
  has_many :comments
end