require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#update_counter' do
    subject { FactoryBot.create :comment }

    it 'should update the post comments counter' do
      subject.update_counter(2)
      expect(subject.post.comments_counter).to be(2)
    end
  end
end
