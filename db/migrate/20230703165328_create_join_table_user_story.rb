class CreateJoinTableUserStory < ActiveRecord::Migration[7.0]
  def change
    create_join_table :users, :stories, table_name: :picked_stories do |t|
      t.index [:user_id, :story_id], unique: true
    end
  end
end
