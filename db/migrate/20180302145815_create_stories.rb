class CreateStories < ActiveRecord::Migration[5.1]
  def change
    create_table :stories do |t|
      t.text :title
      t.text :text
      t.integer :hn_id
      t.integer :user_id
      t.timestamps
    end
  end
end
