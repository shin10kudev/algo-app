class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

	# def self.search(search)
	#   if search
	#     Post.where('LOWER(title) LIKE ? OR LOWER(description) LIKE ? OR LOWER(category) LIKE ? OR LOWER(difficulty) LIKE ?', "%#{search.downcase}%", "%#{search.downcase}%", "%#{search.downcase}%", "%#{search.downcase}%")
	#   else
	#     Post.all.order(created_at: "DESC")
	#   end
	# end
end
