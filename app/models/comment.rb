class Comment < ApplicationRecord
  belongs_to :creator
  belongs_to :parent
end
