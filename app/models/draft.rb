# == Schema Information
#
# Table name: drafts
#
#  id            :integer          not null, primary key
#  postscript    :text(65535)
#  preface       :text(65535)
#  subtitle      :string(255)
#  text          :text(65535)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  novel_id      :integer
#  sequential_id :integer          not null
#
# Indexes
#
#  index_drafts_on_novel_id                    (novel_id)
#  index_drafts_on_novel_id_and_sequential_id  (novel_id,sequential_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (novel_id => novels.id)
#

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
