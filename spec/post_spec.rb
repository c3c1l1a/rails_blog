require 'rails_helper'
describe Post, type: :model do
  let (:author) { 
    User.create(name: 'Lilly', 
        photo: 'https://unsplash.com/photos/F_-0BxGuVvo', 
        bio: 'Teacher from Poland',
        posts_counter: 0
      )}

  subject {
    Post.create(
      author: author,
      title: 'Hello',
      text: 'This is my first post'
    )}

  before (:each) do 
    5.times { 
      comment = Comment.new(post: subject, author: author, text: 'This is my comment') 
      comment.update_comments_counter_for_post
    } 

    3.times {
      likes = Like.new(post: subject, author: author)
      likes.update_likes_counter_for_post
    }
  end

  it 'invalidate when title is not given' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'validate when name is given' do 
    expect(subject).to be_valid
  end

  it 'validates comments counter is > 0' do 
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'validates likes counter is > 0' do 
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  it 'updates post counter for user' do 
    expect{ subject.update_posts_counter_for_user }.to change { author.posts_counter }.by(1)
  end

  it 'Fetches 5 recent comments' do 
    expect(subject.recent_comments.size).to eql(subject.comments.last(5).size)
  end
end