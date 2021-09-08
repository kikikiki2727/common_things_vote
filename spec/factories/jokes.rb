FactoryBot.define do
  factory :joke do
    sequence(:sentence) { |n| "sentence_#{n}" }
    association :user
  end
end
