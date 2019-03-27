class User < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :dislikes, dependent: :destroy
  has_many :inverse_likes, class_name: "Like", foreign_key: "likee_id", dependent: :destroy
  has_many :inverse_dislikes, class_name: "Dislike", foreign_key: "dislikee_id", dependent: :destroy
  has_many :matches, through: :likes, dependent: :destroy

  # makes sure all fields are filled
  validates :username, :email, :location, :pet_name, :pet_age, :pet_bio, :pet_pic, presence: true

  # username & email must be unique & are not case sensitive
  validates :username, :email, uniqueness: true, case_sensitive: false

  # length validations
  validates :username, length: {in: 5..20}
  validates :pet_bio, length: {in: 10..300}

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  # no numbers; need to add other validations!
  validates :location, numericality: false

  has_many_attached :pet_pic


  has_secure_password

  # trying to validate that pic is an image, doesn't work:
  # validates :pet_pic, { with: "image/jpg", "image/jpeg", "image/png", "image/gif"}

  # HELPER METHODS


  # returns array - all users that haven't been liked or disliked by user
  def users_not_seen_yet
    arr = []
    arr << self.who_user_likes << self.who_user_dislikes << self.id
    arr = arr.flatten
    User.where.not(id: arr)
  end

  def who_user_likes
    self.likes.map do |like|
      like.likee_id
    end
  end

  def who_user_dislikes
    self.dislikes.map do |dislike|
      dislike.dislikee_id
    end
  end

  def who_likes_user
    self.inverse_likes.map do |inv_like|
      inv_like.user_id
    end
  end

  def get_match_ids
    self.who_likes_user.select do |liker|
      self.who_user_likes.select do |like|
        like == liker
      end
    end
  end

  def get_matches
    match_ids = self.get_match_ids
    match_ids.map do |match_id|
      User.find_by(id: match_id)
    end
  end

end
