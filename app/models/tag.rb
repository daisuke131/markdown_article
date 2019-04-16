class Tag < ApplicationRecord
  has_many :article_tags, dependent: :destroy
  has_many :articles, throgh: :article_tags
end
