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

  has_one_attached :pet_pic
  # validates_format_of :pet_pic, { with: "image/jpg", "image/jpeg", "image/png", "image/gif"}

end
