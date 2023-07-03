class CreateStories < ActiveRecord::Migration[7.0]
  def change
    create_table :stories do |t|
      t.text :title, null: false
      t.string :author, null: false
      t.integer :external_id, null: false, index: { unique: true }
      t.integer :time, null: false

      t.timestamps
    end
  end
end
