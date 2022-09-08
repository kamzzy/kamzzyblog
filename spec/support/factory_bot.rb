FactoryBot.define do
  factory :user do
    name { 'John Doe' }
    photo { 'https://avatars3.githubusercontent.com/u/17098?s=460&v=4' }
    bio { 'I am a developer' }
    posts_counter { 0 }
  end
  factory :post do
    user
    title { 'My first post' }
    text { 'This is my first post' }
    comments_counter { 0 }
    likes_counter { 0 }
  end
  factory :comment do
    user
    post
    text { 'This is my first comment' }
  end
  factory :like do
    user
    post
  end
end
