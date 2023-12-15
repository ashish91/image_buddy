class Feed < ApplicationRecord
  belongs_to :post
  delegate :title, :body, :image, :views_count, :likes_count, to: :post
end
