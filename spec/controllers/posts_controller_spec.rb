require 'rails_helper'

RSpec.describe 'Post controller', type: :request do
  before(:each) do
    @user = User.create!(name: 'Tom',
                         photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                         bio: 'Teacher from Mexico.',
                         posts_counter: 0)

    @post = Post.create!(author: @user,
                         title: 'Hello',
                         text: 'This is my first post',
                         comments_counter: 0,
                         likes_counter: 0)
  end
  it 'checks if response status code 200' do
    get "/users/#{@user.id}/posts"
    expect(response).to have_http_status(200)
  end

  it 'checks if index template was rendered.' do
    get "/users/#{@user.id}/posts"
    expect(response).to render_template(:index)
  end

  it 'checks if the response body includes correct placeholder text.' do
    get "/users/#{@user.id}/posts"
    expect(response.body).to include('This is my first post')
  end

  it 'checks if response status code 200 for a single post' do
    get "/users/#{@user.id}/posts/#{@post.id}"
    expect(response).to have_http_status(200)
  end

  it 'checks if show template was rendered for a single post.' do
    get "/users/#{@user.id}/posts/#{@post.id}"
    expect(response).to render_template(:show)
  end

  it 'checks if the response body includes correct placeholder text for a single user.' do
    get "/users/#{@user.id}/posts/#{@post.id}"
    expect(response.body).to include('This is my first post')
  end
end
