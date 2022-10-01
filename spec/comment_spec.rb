require 'rails_helper'
describe Comment, type: :model do
  let (:author) { 
    User.create(name: 'Lilly', 
        photo: 'https://unsplash.com/photos/F_-0BxGuVvo', 
        bio: 'Teacher from Poland',
        posts_counter: 0
      )}

  let (:post) {
    Post.create(
      author: author,
      title: 'Hello',
      text: 'This is my first post',
      comments_counter: 0,
      likes_counter: 0
    )}

  subject {
    Comment.create(post: post, author: author, text: 'This is my comment')
  }

  it 'checkes if like is valid' do
    expect(subject).to be_valid
  end

  it 'updates likes counter for a post' do 
    expect{ subject.update_comments_counter_for_post }.to change { post.comments_counter }.by(1)
  end

end