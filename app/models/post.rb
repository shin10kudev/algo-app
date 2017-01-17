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

  # def self.search(search)
  #   if search
  #     search = search.downcase

  #     Post.where('LOWER(title) LIKE ? OR LOWER(description) LIKE ? OR LOWER(category) LIKE ? OR LOWER(difficulty) LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
  #   else
  #     Post.all.order(created_at: "DESC")
  #   end
  # end
end
