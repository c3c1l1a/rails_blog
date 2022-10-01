require 'rails_helper'
describe User, type: :model do
  subject do
    User.new(name: 'Lilly',
                photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                bio: 'Teacher from Poland')
  end

  before(:each) do
    3.times do
      post = Post.new(author: subject, title: 'Intro', text: 'Welcome to this blog!')
      post.update_posts_counter_for_user
    end
  end

  it 'invalidate when name is not given' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'validate when name is given' do
    expect(subject).to be_valid
  end

  it 'validates post counter is > 0' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  it 'validates post counter in an integer' do
    subject.posts_counter = 1.1
    expect(subject).to_not be_valid
  end

  it 'Fetches 3 recent posts' do
    expect(subject.recent_posts.size).to eql(subject.posts.last(3).size)
  end
end
