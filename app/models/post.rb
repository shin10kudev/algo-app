class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy

  # Likes
  has_many :likes, dependent: :destroy, source: :user
  has_many :users, through: :likes
  has_many :liked_by, through: :likes, source: :user

  # Validations
  validates :title, presence: true, length: { in: 2..75 }
  validates :description, presence: true, length: { in: 2..500 }
  validates :code, presence: true
  validates :user_id, presence: true
  validates :difficulty,
    presence: true,
    inclusion: { in: [ 'Easy', 'Medium', 'Hard' ],
    message: "%{value} is not a valid difficulty level" }
  validates :category_id,
    presence: true,
    inclusion: { in: Category.all.map{ |category| category.id },
    message: "%{value} is not a valid category" }

  # perform search on Posts
  def self.search(search)
    if search
      search = search.downcase
      Post.where('LOWER(title) LIKE ? OR LOWER(description) LIKE ? OR LOWER(difficulty) LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%")
    end
  end

  # Friendly_id
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders, :history]
end
