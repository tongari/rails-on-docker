class User < ApplicationRecord
  has_many :favorites, dependent: :destroy

  validates :name, presence: true
  validates :gender, presence: true
end
