class SubmitNovel < ApplicationRecord
  belongs_to :draft
  has_one :novel, through: :draft
  
  validates :draft_id, :text, :subtitle, presence: true
  validates :subtitle, length:{maximum: 100}
  validates :text, length:{maximum: 10000}
  validates :preface, :postscript, length:{maximum: 1000}
end
