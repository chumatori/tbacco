class Reaction < ApplicationRecord
  enum kind: {like: 0, dislike: 1}
  belongs_to :article
  belongs_to :user
end