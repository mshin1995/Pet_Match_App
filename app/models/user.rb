class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true, length: {in: 6..10}
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :location, presence: true, numericality: false
  validates :pet_name, presence: true
  validates :pet_age, presence: true
  validates :pet_bio, presence: true, length: {in: 10..300}
  validates :pet_pic, presence: true
  has_one_attached :pet_pic

  has_many :likes, dependent: :destroy
  has_many :inverse_likes, class_name: "Like", foreign_key: "likee_id", dependent: :destroy


end
