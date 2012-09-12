class MakeUrlSlugPostIndex < ActiveRecord::Migration
  def change
    add_index :posts, :url_slug
  end
end
