class RemoveCategoryFromPosts < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :category
  end
end
