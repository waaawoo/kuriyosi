FactoryBot.define do
  factory :user do
    email { Faker::Internet.freeze.email }
    password { "1q1q1q" }
    password_confirmation { password }
  end
end
