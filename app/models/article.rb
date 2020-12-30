class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user

  validates :title, presence: true, length: { minimum: 5 }
  validates :text, presence: true, length: { minimum: 5 }
end
