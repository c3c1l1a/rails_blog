require 'rails_helper'

RSpec.describe 'User controller', type: :request do
  it 'checks if response status code 200' do
    get '/users'
    expect(response).to have_http_status(200)
  end

  it 'checks if index template was rendered.' do
    get '/users'
    expect(response).to render_template(:index)
  end

  it 'checks if response status code 200 for a single user' do
    User.create!(name: 'Tom', 
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo', 
      bio: 'Teacher from Mexico.', 
      posts_counter: 0)
    get '/users', params: :user_id
    expect(response).to have_http_status(200)
  end

  it 'checks if show template was rendered for a single user.' do
    User.create!(name: 'Tom', 
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo', 
      bio: 'Teacher from Mexico.', 
      posts_counter: 0)

    get '/users', params: {id: 1}
    expect(response).to render_template(:index)
  end
end
