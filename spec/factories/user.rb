FactoryBot.define do
  factory :user do
    first_name "Joe"
    last_name "Smith"
    email "joe@example.com"
    password "123456"
  end

  factory :second_user, parent: :user do
    first_name "Mike"
    last_name "Jones"
    email "mike@example.com"
    password "789012"
  end
end

