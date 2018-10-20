class Draft < ApplicationRecord
  belongs_to :novel
  has_one :submit_novel, dependent: :destroy
  
  validates :novel_id, presence: true
  validates :text, length: {maximum: 10000}
  validates :subtitle, length: {maximum: 100}
  validates :preface, length: {maximum: 1000}
  validates :postscript, length: {maximum: 1000}
  
  acts_as_sequenced scope: :novel_id
end
