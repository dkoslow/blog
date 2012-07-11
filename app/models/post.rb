class Post < ActiveRecord::Base
  attr_accessible
  default_scope order: 'posts.created_at DESC'
end
