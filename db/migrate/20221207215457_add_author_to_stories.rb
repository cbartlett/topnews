class AddAuthorToStories < ActiveRecord::Migration[7.0]
  def change
    add_column :stories, :author, :text
  end
end
