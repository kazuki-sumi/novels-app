class Favorite < ApplicationRecord
  belongs_to :novel
  belongs_to :user
  
  validates :user_id, presence: true
  validates :novel_id, presence: true
  
  
  
  def self.ranking
    self.group(:novel_id).order('count_novel_id DESC').limit(10).count(:novel_id)
  end
end
