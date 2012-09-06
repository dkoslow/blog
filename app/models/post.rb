class Post < ActiveRecord::Base
  attr_accessible :title, :content
  default_scope order: 'posts.created_at DESC'
end



# == Schema Information
#
# Table name: posts
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  content    :text
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

