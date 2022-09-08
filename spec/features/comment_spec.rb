require 'spec_helper'
RSpec.describe 'Comment integrations', type: :feature do
  it 'creates a new comment' do
    user = FactoryBot.create(:user)
    user.confirmed_at = Time.now
    user.save
    login_as(user, scope: :user)
    post = create(:post, user:)
    visit new_user_post_comment_path(user, post)
    fill_in 'Comment:', with: 'This is my first comment'
    click_button 'Add Comment'
    expect(current_path).to eq(user_post_path(user, post))
  end
end
