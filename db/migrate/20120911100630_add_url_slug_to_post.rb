class AddUrlSlugToPost < ActiveRecord::Migration
  def change
    add_column :posts, :url_slug, :string

  end
end
