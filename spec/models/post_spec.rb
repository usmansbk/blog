require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validates' do
    subject { Post.first }

    before { subject.save }

    it 'should have a title' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'should have title with at most 250 characters' do
      subject.title = 'RoR' * 250
      expect(subject).to_not be_valid
    end

    it 'should not have a blank title' do
      subject.title = ' '
      expect(subject).to_not be_valid
    end

    it 'should have a postive integer comments counter' do
      subject.comments_counter = -1
      expect(subject).to_not be_valid
    end

    it 'should have a postive integer likes counter' do
      subject.likes_counter = -1
      expect(subject).to_not be_valid
    end
  end

  describe '#recent_comments' do
    subject { Post.first }

    it 'should return 3 posts' do
      expect(subject.recent_comments.length).to be(5)
    end
  end

  describe '#update_counter' do
    subject { Post.first }

    it 'should update the user posts counter' do
      subject.update_counter(2)
      expect(subject.user.posts_counter).to be(2)
    end
  end
end
