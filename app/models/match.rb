class Match < ApplicationRecord
  belongs_to :user, through: :likes
  belongs_to :likee, class_name: "User", through: :likes
end
