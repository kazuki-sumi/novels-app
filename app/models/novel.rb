class Novel < ApplicationRecord
  belongs_to :user
  
  validates :user_id, presence: true
  validates :sentence, presence: true, length: {maximum: 1000, minimum: 1}
  validates :title, presence: true, length: {maximum: 100, minimum: 1}
  
  has_many :favorites
  has_many :favorite_user, through: :favorites, source: :user
end
