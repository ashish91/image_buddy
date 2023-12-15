class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, foreign_key: "creator_id", class_name: "Post", dependent: :destroy
  has_many :comments, foreign_key: "creator_id", class_name: "Comment", dependent: :destroy
  has_many :likes

  has_many :feeds

  # has_many :followers, through: :relationships
  # has_many :followees, foreign_key: "follower_id", class_name: 'Relationship'

  def followers
    User.where(id: Relationship.where(followee_id: self.id).pluck(:follower_id))
  end

  def followees
    User.where(id: Relationship.where(follower_id: self.id).pluck(:followee_id))
  end

  def follows?(user)
    Relationship.exists?(
      follower_id: self.id,
      followee_id: user.id
    )
  end
end
