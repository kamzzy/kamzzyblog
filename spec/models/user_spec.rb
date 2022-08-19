require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.new(name: 'Example User',
                     photo: 'https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png',
                     bio: 'a short bio', posts_counter: 0)
  end
  it 'is valid with valid attributes' do
    expect(@user).to be_valid
  end
  it 'is not valid without a name' do
    @user.name = nil
    expect(@user).to_not be_valid
  end
  it 'posts_counter is not valid without a numericality' do
    @user.posts_counter = 'a'
    expect(@user).to_not be_valid
  end
  it 'posts_counter is not valid without a greater_than_or_equal_to' do
    @user.posts_counter = -1
    expect(@user).to_not be_valid
  end
  it 'posts_counter is not valid without a only_integer' do
    @user.posts_counter = 1.1
    expect(@user).to_not be_valid
  end
  it 'displays the three most recent posts' do
    expect(@user.three_most_recent_posts).to eq([])
  end
end
