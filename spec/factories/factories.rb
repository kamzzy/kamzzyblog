FactoryBot.define do
  factory :role do
    name { 'admin' }
  end
  factory :user do
    role
    name { 'John Doe' }
    photo { 'https://avatars3.githubusercontent.com/u/17098?s=460&v=4' }
    bio { 'I am a developer' }
    posts_counter { 0 }
    email { 'test@test.com' }
    password { '123456' }
    password_confirmation { '123456' }
    jti { '08da43f5-7eef-4f14-90a1-1252863e070f' }
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
