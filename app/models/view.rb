class View < ApplicationRecord
  belongs_to :viewer, class_name: 'User'
end
