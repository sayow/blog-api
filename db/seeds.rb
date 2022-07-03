# frozen_string_literal: true

require 'faker'

puts 'Destroying old data...........................'
User.destroy_all
Post.destroy_all
Comment.destroy_all
Subcomment.destroy_all

# _________________________________________________________________

puts 'Creating new users..........................'
10.times do
  User.create(name: Faker::FunnyName.name)
end

# _________________________________________________________________

puts 'Writing new posts..........................'
users = User.all
30.times do
  Post.create(post_content: Faker::Lorem.paragraph(sentence_count: 10), user: users.sample)
end

# _________________________________________________________________

puts 'Commenting the posts..........................'
posts = Post.all
10.times do
  Comment.create(comment_content: Faker::Lorem.sentences, user: users.sample, post: posts.sample)
end

# _________________________________________________________________

puts 'Commenting the coments..........................'
comments = Comment.all
10.times do
  Subcomment.create(subcomment_content: Faker::Lorem.question, user: users.sample, comment: comments.sample)
end
