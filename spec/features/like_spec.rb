require 'spec_helper'

RSpec.describe 'Like integrations', type: :feature do
  it 'creates a new like' do
    user = FactoryBot.create(:user)
    user.confirmed_at = Time.now
    user.save
    login_as(user, scope: :user)
    post = create(:post, user:)
    visit new_user_post_like_path(user, post)
    click_button 'Add like'
    expect(current_path).to eq(user_post_path(user, post))
  end
end
