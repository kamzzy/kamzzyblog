require 'spec_helper'
RSpec.describe 'Comment integrations', type: :feature do
  it 'creates a new comment' do
    user = create(:user)
    post = create(:post, user:)
    visit new_user_post_comment_path(user, post)
    fill_in 'Comment:', with: 'This is my first comment'
    click_button 'Add Comment'
    expect(current_path).to eq(user_post_path(user, post))
  end
  it 'renders newly created comment' do
    user = create(:user)
    post = create(:post, user:)
    create(:comment, post:)
    visit user_post_path(user, post)
    expect(page).to have_content('This is my first comment')
  end
end
