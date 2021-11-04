require 'rails_helper'

RSpec.describe Like, type: :model do
  describe '#update_counter' do
    subject { FactoryBot.create :like }

    it 'should update the post likes counter' do
      subject.update_counter(2)
      expect(subject.post.likes_counter).to be(2)
    end
  end
end
