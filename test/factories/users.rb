FactoryBot.define do
    factory :user do
      first_name { "Jane" }
      last_name { "doe" }
      email { "doe@gmail.com" }
      password { "test123" }
      password_confirmation { "test123" }
    end
  end
  