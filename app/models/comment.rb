class Comment < ApplicationRecord
  belongs_to :article
  validates :text, presence: true
  has_one :article, inverse_of: :article
end