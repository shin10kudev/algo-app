class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # validations
  validates :username, presence: true, length: { in: 2..30 }
  validates_uniqueness_of :username

  # allows you to use User.admin?
  enum role: [ :general, :admin ]

  # Posts and comments
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy

  # Likes
  has_many :likes, dependent: :destroy, source: :post
  has_many :liked, through: :likes, source: :post

  # Friendships
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id"
  has_many :inverse_friends, through: :inverse_friendships, source: :user

  has_attached_file :image, styles: { medium: "150x150#", small: "85x85#", thumb: "35x35#" }, default_url: "paperclip/:style/missing-user-image.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  # Friendly_id
  extend FriendlyId
  friendly_id :username, use: [:finders]

  def should_generate_new_friendly_id?
    true
  end
end
