class CreateUserStories < ActiveRecord::Migration[7.0]
  def change
    create_table :user_stories do |t|
      t.integer :user_id
      t.integer :story_id

      t.timestamps
    end
  end
end
