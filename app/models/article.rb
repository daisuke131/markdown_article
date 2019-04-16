class Article < ApplicationRecord
  belongs_to :user
  has_many :article_tags, dependent: :destroy
  has_many :tags, through: :article_tags
  has_many :likes, dependent: :destroy
  enum status: { draft: 0, published: 1, secret: 2 }
end
