class RemoveDescriptionAtBlogs < ActiveRecord::Migration[5.2]
  def change
    remove_column :blogs, :description, :text
  end
end
