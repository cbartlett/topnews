class CreateStories < ActiveRecord::Migration[7.0]
  def change
    create_table :stories do |t|
      t.text :title
      t.bigint :remote_id
      t.integer :descendents
      t.json :kids
      t.integer :score
      t.timestamp :remote_timestamp
      t.text :type
      t.text :url

      t.timestamps
    end
  end
end
