require 'rails_helper'
describe Like, type: :model do
  let(:author) do
    User.new(name: 'Lilly',
             photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
             bio: 'Teacher from Poland',
             posts_counter: 0)
  end

  let(:post) do
    Post.new(
      author: author,
      title: 'Hello',
      text: 'This is my first post',
      comments_counter: 0,
      likes_counter: 0
    )
  end

  subject do
    Like.new(post: post, author: author)
  end

  it 'checkes if like is valid' do
    expect(subject).to be_valid
  end

  it 'updates likes counter for a post' do
    expect { subject.update_likes_counter_for_post }.to change { post.likes_counter }.by(1)
  end
end
