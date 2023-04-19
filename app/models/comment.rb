class Comment < ApplicationRecord
  belongs_to :article
  validates :text, presence: true
end