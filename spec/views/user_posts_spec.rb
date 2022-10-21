require 'rails_helper'

RSpec.describe 'User posts', type: :system do
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

    @post2 = Post.create!(author: @user1,
                         title: 'Second post',
                         text: 'This is my second post',
                         comments_counter: 0,
                         likes_counter: 0)
    @post3 = Post.create!(author: @user1,
                         title: 'Third post',
                         text: 'This is my third post',
                         comments_counter: 0,
                         likes_counter: 0)
  end

  it 'can see the user profile picture' do
    visit users_path
    sleep(5)
    click_link @user1.name
    sleep(5)
    click_link 'Show all posts'
    sleep(5)

    image=find(:xpath, "//img[@class='user-image']")
    image['src'].should eq('https://unsplash.com/photos/F_-0BxGuVvo/')
  end

  it 'I can see the user username' do
    visit users_path
    sleep(5)
    click_link @user1.name
    sleep(5)
    click_link 'Show all posts'
    sleep(5)

    expect(page).to have_content(@user1.name)
  end

  it 'can see the number of posts the user has written' do
    visit users_path
    sleep(5)
    click_link @user1.name
    sleep(5)
    click_link 'Show all posts'
    sleep(5)

    expect(page).to have_content(@user1.posts_counter)
  end

  it 'I can see a posts title.' do
    visit users_path
    sleep(5)
    click_link @user1.name
    sleep(5)
    click_link 'Show all posts'
    sleep(5)

    expect(page).to have_content(@post1.title)
    expect(page).to have_content(@post2.title)
    expect(page).to have_content(@post3.title)
  end

  it 'I can see some of the post body' do
    visit users_path
    sleep(5)
    click_link @user1.name
    sleep(5)
    click_link 'Show all posts'
    sleep(5)

    expect(page).to have_content(@post1.text)
    expect(page).to have_content(@post2.text)
    expect(page).to have_content(@post3.text)
  end

  it 'I can see the first comments on a post' do
    visit users_path
    sleep(5)
    click_link @user1.name
    sleep(5)
    click_link 'Show all posts'
    sleep(5)

    expect(page).to have_content(@comment1.text)
  end

  it 'I can see how many comments a post has' do
    visit users_path
    sleep(5)
    click_link @user1.name
    sleep(5)
    click_link 'Show all posts'
    sleep(5)

    expect(page).to have_content(@post1.comments_counter)
  end

  it 'I can see how many likes a post has' do
    visit users_path
    sleep(5)
    click_link @user1.name
    sleep(5)
    click_link 'Show all posts'
    sleep(5)

    expect(page).to have_content(@post1.likes_counter)
  end

  it 'When I click on a post, it redirects me to that post show page.' do
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
 
end