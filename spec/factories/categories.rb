FactoryBot.define do
  factory :category do
    name {"hello!"}
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    user
  end
end