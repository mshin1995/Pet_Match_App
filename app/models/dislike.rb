class Dislike < ApplicationRecord
  belongs_to :user
  belongs_to :dislikee, class_name: "User"
end
