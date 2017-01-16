class Category < ApplicationRecord
  has_many :posts
  before_save :format_category_name
  before_destroy :category_exists

  validates :name, presence: true, length: { in: 2..30 }

  def format_category_name
    self.name = self.name.titleize
  end

  def category_exists
    if self.posts.present?
      return false
    end
  end
end
