namespace :db do
  desc "Fill database with sample posts"
  task populate: :environment do
    21.times do |n|
      title = "This will be where the title goes #{n+1}"
      content = Faker::Lorem.sentence(200)
      Post.create!(title: title, content: content)
    end
  end
end