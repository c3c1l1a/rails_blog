# require 'rails_helper'

# RSpec.describe 'User show', type: :system do
#   before(:each) do
#     @user1 = User.create!(name: 'Tom',
#                          photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
#                          bio: 'Teacher from Mexico.',
#                          posts_counter: 0)
#     @post1 = Post.create!(author: @user1,
#                          title: 'First post',
#                          text: 'This is my first post',
#                          comments_counter: 0,
#                          likes_counter: 0)
#     @post2 = Post.create!(author: @user1,
#                          title: 'Second post',
#                          text: 'This is my second post',
#                          comments_counter: 0,
#                          likes_counter: 0)
#     @post3 = Post.create!(author: @user1,
#                          title: 'Third post',
#                          text: 'This is my third post',
#                          comments_counter: 0,
#                          likes_counter: 0)
#   end

#   it 'can see the user profile picture' do
#     visit users_path
#     sleep(5)
#     click_link @user1.name
#     sleep(5)
#     image=find(:xpath, "//img[@class='user-image']")
#     image['src'].should eq('https://unsplash.com/photos/F_-0BxGuVvo/')
#   end

#   it 'can see user username' do
#     visit users_path
#     sleep(5)
#     click_link @user1.name
#     sleep(5)
#     expect(page).to have_content(@user1.name)
#   end

#   it 'can see the number of posts the user has written' do
#     visit users_path
#     sleep(5)
#     click_link @user1.name
#     sleep(5)
#     expect(page).to have_content(@user1.posts_counter)
#   end

#   it 'I can see the user bio.' do
#     visit users_path
#     sleep(5)
#     click_link @user1.name
#     sleep(5)
#     expect(page).to have_content(@user1.bio)
#   end

#   it 'I can see the user first 3 posts.' do
#     visit users_path
#     sleep(5)
#     click_link @user1.name
#     sleep(5)
#     expect(page).to have_content(@post1.title)
#     expect(page).to have_content(@post2.title)
#     expect(page).to have_content(@post3.title)
#   end

#   it ' can see a button that lets me view all of a user posts.' do
#     visit users_path
#     sleep(5)
#     click_link @user1.name
#     sleep(5) 
#     click_link 'Show all posts'
#     sleep(5)

#     expect(page).to have_content(@post1.title)
#     expect(page).to have_content(@post2.title)
#     expect(page).to have_content(@post3.title)
#   end

#   it 'When I click a user post, it redirects me to that post show page.' do
#     visit users_path
#     sleep(5)
#     click_link @user1.name
#     sleep(5) 
#     click_link @post1.title
#     sleep(5)
    
#     expect(page).to have_content(@post1.title)
#   end

#   it 'When I click to see all posts, it redirects me to the user post index page' do
#     visit users_path
#     sleep(5)
#     click_link @user1.name
#     sleep(5) 
#     click_link 'Show all posts'
#     sleep(5)
  
#     expect(page).to have_content(@post1.title)
#     expect(page).to have_content(@post2.title)
#     expect(page).to have_content(@post3.title)
#   end
# end