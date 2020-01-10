class DropTableUnuse < ActiveRecord::Migration[5.2]
  def change
    drop_table :commontator_comments
    drop_table :commontator_subscriptions
    drop_table :commontator_threads
    drop_table :technologies
    drop_table :skills
    drop_table :portfolios
    drop_table :votes

  end
end
