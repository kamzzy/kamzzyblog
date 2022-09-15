require 'spec_helper'

RSpec.describe 'User integrations', type: :feature do
  it 'displays all users' do
    user = FactoryBot.create(:user)
    user.confirmed_at = Time.now
    user.save
    login_as(user, scope: :user)
    visit users_path
    expect(page).to have_content('John Doe')
  end
  it 'displays total number of posts' do
    user = FactoryBot.create(:user)
    user.confirmed_at = Time.now
    user.save
    login_as(user, scope: :user)
    create(:post, user:)
    create(:post, user:)
    visit users_path
    expect(page).to have_content(2)
  end
  it 'displays user profile' do
    user = FactoryBot.create(:user)
    user.confirmed_at = Time.now
    user.save
    login_as(user, scope: :user)
    visit user_path(user)
    expect(page).to have_content('John Doe')
  end
  it 'displays three most recent posts' do
    user = FactoryBot.create(:user)
    user.confirmed_at = Time.now
    user.save
    login_as(user, scope: :user)
    create(:post, user:)
    create(:post, user:)
    create(:post, user:)
    create(:post, user:)
    visit user_path(user)
    expect(page).to have_content('My first post', count: 3)
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
  it 'redirects to post page when user clicks on "See More Posts" link' do
    user = FactoryBot.create(:user)
    user.confirmed_at = Time.now
    user.save
    login_as(user, scope: :user)
    create(:post, user:)
    visit user_path(user)
    click_link 'See More Posts'
    expect(current_path).to eq(user_posts_path(user))
  end
  it 'redirects to post page when user clicks on  post content link' do
    user = FactoryBot.create(:user)
    user.confirmed_at = Time.now
    user.save
    login_as(user, scope: :user)
    post = create(:post, user:)
    visit user_path(user)
    click_link 'My first post'
    expect(current_path).to eq(user_post_path(user, post))
  end
end
