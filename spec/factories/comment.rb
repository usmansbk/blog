FactoryBot.define do
  factory :comment do
    user
    post
    text { 'Test comment' }
  end

  factory :like do
    post
    user
  end
end
