class Comment < ApplicationRecord
  belongs_to :creator
  belongs_to :parent

  has_many :likes, dependent: :destroy
end
