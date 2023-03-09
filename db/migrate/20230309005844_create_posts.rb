# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.bigint :hacker_news_post_id, null: false
      t.string :by
      t.string :score
      t.string :title
      t.datetime :time
      t.string :url

      t.timestamps
    end
  end
end
