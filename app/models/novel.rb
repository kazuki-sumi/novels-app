class Novel < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :summary, presence: true, length: {maximum: 1000, minimum: 1}
  validates :title, presence: true, length: {maximum: 100, minimum: 1}
  
  has_many :favorites, dependent: :destroy
  has_many :favorite_user, through: :favorites, source: :user
  has_many :drafts, dependent: :destroy
  has_many :submit_novels, through: :drafts
  
  scope :posted_novels, ->(params) do
    where(user_id: params).joins(:drafts => :submit_novel).distinct
  end
end
