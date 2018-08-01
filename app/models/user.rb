class User < ApplicationRecord
    validates :name, presence: true, length: { maximum: 50 }
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
    has_secure_password
    mount_uploader :image, ImageUploader
    
    has_many :novels
    
    has_many :favorites
    has_many :favorite_novels, through: :favorites, source: :novel
    
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
end
