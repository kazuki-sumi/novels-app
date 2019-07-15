# == Schema Information
#
# Table name: novels
#
#  id         :integer          not null, primary key
#  summary    :text(65535)
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_novels_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

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
