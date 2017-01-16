class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, presence: true, length: { in: 2..30 }
  validates :description, presence: true, length: { in: 2..250 }
  validates :code, presence: true
  validates :category_id, presence: true
  validates :user_id, presence: true
  validates :difficulty,
    presence: true,
    inclusion: { in: [ 'Easy', 'Medium', 'Hard' ],
    message: "%{value} is not a valid difficulty level" }

  validates :category, presence: true

end
