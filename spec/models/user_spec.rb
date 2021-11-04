require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validates' do
    subject { FactoryBot.build :user }

    it 'should have a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should have an alpha name' do
      subject.name = ' '
      expect(subject).to_not be_valid
    end

    it 'should have a postive integer posts counter' do
      subject.posts_counter = -1
      expect(subject).to_not be_valid
    end
  end

  describe '#recent_posts' do
    subject { FactoryBot.create :user_with_posts, posts_counter: 3 }

    it 'should return 3 posts' do
      expect(subject.recent_posts.length).to be(3)
    end
  end
end
