require 'rails_helper'

RSpec.describe 'User controller', type: :request do
  it 'checks if response status code 200' do
    get '/users/1/posts'
    expect(response).to have_http_status(200)
  end

  it 'checks if index template was rendered.' do
    get '/users/1/posts'
    expect(response).to render_template(:index)
  end

  it 'checks if the response body includes correct placeholder text.' do
    get '/users/1/posts'
    expect(response.body).to include('List all posts for a particular user here ')
  end

  it 'checks if response status code 200 for a single post' do
    get '/users/1/posts/1'
    expect(response).to have_http_status(200)
  end

  it 'checks if show template was rendered for a single post.' do
    get '/users/1/posts/1'
    expect(response).to render_template(:show)
  end

  it 'checks if the response body includes correct placeholder text for a single user.' do
    get '/users/1/posts/1'
    expect(response.body).to include('Information for a particular post goes here')
  end
end
