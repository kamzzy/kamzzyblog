require 'spec_helper'
RSpec.describe 'Post integrations', type: :feature do
  it 'displays all posts' do
 
    user = FactoryBot.create(:user)
    user.confirmed_at = Time.now
    user.save
    login_as(user, scope: :user)
    create(:post, user:)
    create(:post, user:)
    visit user_posts_path(user)
    expect(page).to have_content('My first post', count: 2)
  end
 
  it 'displays user profile' do
    user = FactoryBot.create(:user)
    user.confirmed_at = Time.now
    user.save
    login_as(user, scope: :user)
    visit user_posts_path(user)
    expect(page).to have_content('John Doe')
  end
 
  it 'redirects to add new comment page when user clicks on "Add Comments:" link' do
    user = FactoryBot.create(:user)
    user.confirmed_at = Time.now
    user.save
    login_as(user, scope: :user)
    post = create(:post, user:)
    visit user_path(user)
    click_link 'Add Comments:'
    expect(current_path).to eq(new_user_post_comment_path(user, post))
  end
  it 'redirects to add new like page when user clicks on "Likes:" ' do
    user = FactoryBot.create(:user)
    user.confirmed_at = Time.now
    user.save
    login_as(user, scope: :user)
    post = create(:post, user:)
    visit user_path(user)
    click_link 'Likes:'
    expect(current_path).to eq(new_user_post_like_path(user, post))
  end
end
