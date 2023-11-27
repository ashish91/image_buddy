class Comment < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  belongs_to :parent, polymorphic: true

  has_many :likes, as: :parent, dependent: :destroy

  def post
    par = self.parent

    while !par.is_a?(Post)
      par = par.parent
    end

    par
  end
end
