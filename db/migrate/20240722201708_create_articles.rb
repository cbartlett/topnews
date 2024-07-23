class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.integer   :external_id, null: false, index: true
      t.datetime  :time, null: false
      t.string    :by, null: false
      t.string    :url, null: false
      t.string    :title, null: false
      t.string    :kind, null: false
      t.jsonb     :data, null: false

      t.timestamps
    end
  end
end
