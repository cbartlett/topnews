class RenameStoriesTypeToRemoteType < ActiveRecord::Migration[7.0]
  def change
    rename_column :stories, :type, :remote_type
  end
end
