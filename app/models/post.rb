class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

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

end
