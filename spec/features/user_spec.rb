require 'spec_helper'

RSpec.describe 'User integrations', type: :feature do
  it 'displays all users' do
    create(:user)
    visit users_path
    expect(page).to have_content('John Doe')
  end
  it 'displays total number of posts' do
    user = create(:user)
    create(:post, user:)
    create(:post, user:)
    visit users_path
    expect(page).to have_content(2)
  end
  it 'displays user profile' do
    user = create(:user)
    visit user_path(user)
    expect(page).to have_content('John Doe')
  end
  it 'displays three most recent posts' do
    user = create(:user)
    create(:post, user:)
    create(:post, user:)
    create(:post, user:)
    create(:post, user:)
    visit user_path(user)
    expect(page).to have_content('My first post', count: 3)
  end
  it 'redirects to create new post page when user clicks on "Create new Post" link' do
    user = create(:user)
    create(:post, user:)
    visit user_path(user)
    click_link 'Create New Post'
    expect(current_path).to eq(new_user_post_path(user))
  end
  it 'redirects to add new comment page when user clicks on "Add Comments:" link' do
    user = create(:user)
    post = create(:post, user:)
    visit user_path(user)
    click_link 'Add Comments:'
    expect(current_path).to eq(new_user_post_comment_path(user, post))
  end
  it 'redirects to add new like page when user clicks on "Likes:" ' do
    user = create(:user)
    post = create(:post, user:)
    visit user_path(user)
    click_link 'Likes:'
    expect(current_path).to eq(new_user_post_like_path(user, post))
  end
  it 'redirects to post page when user clicks on "See More Posts" link' do
    user = create(:user)
    create(:post, user:)
    visit user_path(user)
    click_link 'See More Posts'
    expect(current_path).to eq(user_posts_path(user))
  end
  it 'redirects to post page when user clicks on  post content link' do
    user = create(:user)
    post = create(:post, user:)
    visit user_path(user)
    click_link 'My first post'
    expect(current_path).to eq(user_post_path(user, post))
  end
end
