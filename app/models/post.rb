class Post < ActiveRecord::Base
  attr_accessible :title, :content
  default_scope order: 'posts.created_at DESC'
end
