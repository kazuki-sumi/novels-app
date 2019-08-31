# == Schema Information
#
# Table name: submit_novels
#
#  id         :integer          not null, primary key
#  postscript :text(65535)
#  preface    :text(65535)
#  subtitle   :string(255)
#  text       :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  draft_id   :integer
#
# Indexes
#
#  index_submit_novels_on_draft_id  (draft_id)
#
# Foreign Keys
#
#  fk_rails_...  (draft_id => drafts.id)
#

class SubmitNovel < ApplicationRecord
  belongs_to :draft
  has_one :novel, through: :draft

  validates :draft_id, :text, :subtitle, presence: true
  validates :subtitle, length:{maximum: 100}
  validates :text, length:{maximum: 10000}
  validates :preface, :postscript, length:{maximum: 1000}
end
