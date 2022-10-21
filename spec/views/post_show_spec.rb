require 'rails_helper'

RSpec.describe 'User posts index', type: :system do
  before(:each) do
    @user1 = User.create!(name: 'Tom',
                         photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                         bio: 'Teacher from Mexico.',
                         posts_counter: 0)
    @post1 = Post.create!(author: @user1,
                         title: 'First post',
                         text: 'This is my first post',
                         comments_counter: 0,
                         likes_counter: 0)
    @comment1 = Comment.create(post: @post1, 
                         author: @user1, 
                         text: 'Thanks all!')
  end

  it 'I can see the post title.' do
    visit users_path
    sleep(5)
    click_link @user1.name
    sleep(5)
    click_link 'Show all posts'
    sleep(5)
    click_link @post1.title
    sleep(5)

    expect(page).to have_content(@post1.title)
  end

  it 'I can see who wrote the post' do
    visit users_path
    sleep(5)
    click_link @user1.name
    sleep(5)
    click_link 'Show all posts'
    sleep(5)
    click_link @post1.title
    sleep(5)

    expect(page).to have_content(@post1.author.name)
  end

  it 'I can see how many comments it has' do
    visit users_path
    sleep(5)
    click_link @user1.name
    sleep(5)
    click_link 'Show all posts'
    sleep(5)
    click_link @post1.title
    sleep(5)

    expect(page).to have_content(@post1.comments_counter)
  end

  it 'I can see how many likes it has' do
    visit users_path
    sleep(5)
    click_link @user1.name
    sleep(5)
    click_link 'Show all posts'
    sleep(5)
    click_link @post1.title
    sleep(5)

    expect(page).to have_content(@post1.likes_counter)
  end

  it 'I can see the post body' do
    visit users_path
    sleep(5)
    click_link @user1.name
    sleep(5)
    click_link 'Show all posts'
    sleep(5)
    click_link @post1.title
    sleep(5)

    expect(page).to have_content(@post1.text)
  end

  it 'I can see the username of each commentor' do
    visit users_path
    sleep(5)
    click_link @user1.name
    sleep(5)
    click_link 'Show all posts'
    sleep(5)
    click_link @post1.title
    sleep(5)

    expect(page).to have_content(@comment1.author.name)
  end

  it 'I can see the comment each commentor left.' do
    visit users_path
    sleep(5)
    click_link @user1.name
    sleep(5)
    click_link 'Show all posts'
    sleep(5)
    click_link @post1.title
    sleep(5)

    expect(page).to have_content(@comment1.text)
  end
end