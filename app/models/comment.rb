class Comment < ApplicationRecord
  belongs_to :article
  validates :text, presence: true
  has_one :article, :foreign_key => 'article_id'
end