class Post < ActiveRecord::Base
  attr_accessible :title, :content
  default_scope order: 'posts.created_at DESC'
  validates :title, uniqueness: true
  before_create :create_slug

  def to_param
    url_slug
  end

  private

    def create_slug
      self.url_slug = title.parameterize
    end
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
#  url_slug   :string(255)
#

