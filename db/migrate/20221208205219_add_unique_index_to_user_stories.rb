class AddUniqueIndexToUserStories < ActiveRecord::Migration[7.0]
  def change
    add_index :user_stories, [:user_id, :story_id], unique: true
  end
end
