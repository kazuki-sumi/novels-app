# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  image           :string(255)
#  name            :string(255)
#  password_digest :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                  format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                  uniqueness: { case_sensitive: false }
  has_secure_password
  mount_uploader :image, ImageUploader

  has_many :novels, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_novels, through: :favorites, source: :novel
  has_many :relationships, dependent: :destroy
  has_many :followings, through: :relationships, source: :follow
  has_many :reverses_of_relationship, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverses_of_relationship, source: :user

  def fav(novel)
    unless self.id == novel.favorites.find_by(user_id: novel.user_id)
       self.favorites.find_or_create_by(novel_id: novel.id)
    end
  end

  def unfav(novel)
    favorite = self.favorites.find_by(novel_id: novel.id)
    favorite.destroy if favorite
  end

  def faving?(novel)
    self.favorite_novels.include?(novel)
  end

  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship =self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end
end

