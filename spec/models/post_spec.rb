require 'spec_helper'

describe "post" do
  before { @post = Post.new }

  subject { @post }

  it { should respond_to(:title) }
  it { should respond_to(:content) }
  it { should respond_to(:url_slug) }

  describe "with the same title" do
    it "should not save the new post" do
      post1 = Post.create(title: "Test Page")
      post1.save
      post2 = Post.create(title: "Test Page")
      post2.save
      post2.should_not be_valid
    end
  end


  describe "with no url slug provided" do
    it "autogenerates a unique url slug" do
      post1 = Post.create(title: "Test Page")
      post1.url_slug.should == "test-page"
    end
  end

  describe "when updating content" do
    it "does not change the url_slug" do
      post1 = Post.create(title: "Test Page")
      post1.url_slug.should == "test-page"
      post1.update_attributes(title: "Test Page", content: "Test update")
      post1.save
      post1.url_slug.should == "test-page"
    end
  end

  describe "when updating title" do
    it "does not change the url_slug" do
      post1 = Post.create(title: "Test Page")
      post1.url_slug.should == "test-page"
      post1.update_attributes(title: "New Test Page", content: "Test update")
      post1.save
      post1.url_slug.should == "test-page"
    end
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

