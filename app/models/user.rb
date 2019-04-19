class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable # , :confirmable
  has_many :articles, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_articles, through: :likes, source: :articles
  has_many :communities, through: :user_communities
  validates :username, presence: true, length: { maximum: 10 }
end
