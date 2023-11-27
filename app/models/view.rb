class View < ApplicationRecord
  belongs_to :viewer, class_name: 'User'
  belongs_to :post

  after_commit :update_posts_view_count, on: :create

  private
    def update_posts_view_count
      post.increment!(:views_count)
    end
end
