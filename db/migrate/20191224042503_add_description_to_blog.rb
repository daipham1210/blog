class AddDescriptionToBlog < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :description, :text
  end
end
