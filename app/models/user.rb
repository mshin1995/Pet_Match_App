class User < ApplicationRecord
  # makes sure all fields are filled
  validates :username, :email, :location, :pet_name, :pet_age, :pet_bio, :pet_pic, presence: true

  # username & email must be unique & are not case sensitive
  validates :username, :email, uniqueness: true, case_sensitive: false

  # length validations
  validates :username, length: {in: 5..20}
  validates :pet_bio, length: {in: 10..300}

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :location, numericality: false

  has_many_attached :pet_pic


  has_many :likes, dependent: :destroy
  has_many :matches, through: :likes, dependent: :destroy
  has_many :inverse_likes, class_name: "Like", foreign_key: "likee_id", dependent: :destroy

  # trying to validate that pic is an image, doesn't work:
  # validates :pet_pic, { with: "image/jpg", "image/jpeg", "image/png", "image/gif"}

  def self.all_except(user)
    where.not(id: user.likes.pluck(:likee_id) << user.id)
  end

end
