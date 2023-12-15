class Post < ApplicationRecord
  belongs_to :creator, class_name: 'User'

  has_and_belongs_to_many :tags
  has_many :comments, as: :parent, dependent: :destroy

  has_many :views, dependent: :destroy
  has_many :likes, as: :parent, dependent: :destroy

  has_many :feeds, dependent: :destroy

  has_one_attached :image

  after_commit :create_feed, on: [:create]

  def upvotes
    likes.upvote
  end

  def downvotes
    likes.downvote
  end

  private
    def create_feed
      FeedGenerationJob.perform_later('created_post', { post_id: id })
    end

end
