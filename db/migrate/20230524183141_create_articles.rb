class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.integer :article_id
      t.string :title
      t.string :author
      t.integer :score
      t.string :url

      t.timestamps
    end
  end
end
