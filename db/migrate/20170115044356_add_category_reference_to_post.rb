class AddCategoryReferenceToPost < ActiveRecord::Migration[5.0]
  def change
    add_reference :posts, :category, index: true
  end
end
