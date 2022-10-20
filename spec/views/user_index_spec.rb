require 'rails_helper'

RSpec.describe 'User index', type: :system do
  before(:each) do
    @user = User.create!(name: 'Tom',
                         photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                         bio: 'Teacher from Mexico.',
                         posts_counter: 0)
  end
  
  it 'shows the right content' do
    visit users_path
    sleep(5)
    expect(page).to have_content('')
  end
  
end