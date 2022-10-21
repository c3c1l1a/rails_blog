require 'rails_helper'

RSpec.describe 'User index', type: :system do
  before(:each) do
    @user1 = User.create!(name: 'Tom',
                         photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                         bio: 'Teacher from Mexico.',
                         posts_counter: 0)
  end

  it 'can see username of all other users' do
    visit users_path
    sleep(5)
    expect(page).to have_content('Tom')
  end

  it 'can seee profile picture for each user' do
    visit users_path
    sleep(5)
    image=find(:xpath, "//img[@class='user-image']")
    image['src'].should eq('https://unsplash.com/photos/F_-0BxGuVvo/')
  end

  it 'can see the number of posts each user has written.' do
    visit users_path
    sleep(5)
    expect(page).to have_content(@user1.posts_counter)
  end



  
end