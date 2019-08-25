# == Schema Information
#
# Table name: favorites
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  novel_id   :integer
#  user_id    :integer
#
# Indexes
#
#  index_favorites_on_novel_id              (novel_id)
#  index_favorites_on_user_id               (user_id)
#  index_favorites_on_user_id_and_novel_id  (user_id,novel_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (novel_id => novels.id)
#  fk_rails_...  (user_id => users.id)
#

class Favorite < ApplicationRecord
  belongs_to :novel
  belongs_to :user

  validates :user_id, presence: true
  validates :novel_id, presence: true

  def self.ranking
    self.group(:novel_id).order('count_novel_id DESC').limit(10).count(:novel_id)
  end
end
