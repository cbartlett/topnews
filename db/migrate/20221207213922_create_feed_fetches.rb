class CreateFeedFetches < ActiveRecord::Migration[7.0]
  def change
    create_table :feed_fetches do |t|
      t.json :ids
      t.boolean :in_progress

      t.timestamps
    end
  end
end
