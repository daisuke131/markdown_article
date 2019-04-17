class Article < ApplicationRecord
  belongs_to :user
  has_many :article_tags, dependent: :destroy
  has_many :tags, through: :article_tags
  has_many :likes, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true
  enum status: ["published", "secret", "draft"]
end
