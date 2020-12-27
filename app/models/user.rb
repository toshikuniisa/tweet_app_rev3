class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  validates :Profile, length: { maximum: 200 }
  validates :name,presence:true,
             uniqueness:true,
             length: {minimum: 1,maximum: 15}
  mount_uploader :image,ImageUploader
  mount_uploader :back_image,ImageUploader
  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :user

  def follow(other_user)
      unless self == other_user
        self.relationships.find_or_create_by(follow_id: other_user.id)
      end
    end

    def unfollow(other_user)
      relationship = self.relationships.find_by(follow_id: other_user.id)
      relationship.destroy if relationship
    end

    def following?(other_user)
      self.followings.include?(other_user)
    end

end
