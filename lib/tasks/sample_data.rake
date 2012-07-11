namespace :db do
  desc "Fill database with sample posts"
  task populate: :environment do
    posts = Post.all(limit: 5)
    21.times do |n|
      title = "Test Post #{n}"
      content = Faker::Lorem.sentence(7)
      posts.each { |post| post.create!(content: content) }
    end
  end
end