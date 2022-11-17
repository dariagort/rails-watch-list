class RemoveColumnAndAddReference < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookmarks, :movie_id
    remove_column :bookmarks, :list_id
    add_reference :bookmarks, :movie
    add_reference :bookmarks, :list
  end
end
