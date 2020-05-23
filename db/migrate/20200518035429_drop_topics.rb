class DropTopics < ActiveRecord::Migration[5.2]
  def change
    remove_column :blogs, :topic_id, :integer
    drop_table :topics
  end
end
