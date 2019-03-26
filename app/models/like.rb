class Like < ApplicationRecord
  belongs_to :user
  belongs_to :likee, class_name: "User"
end
