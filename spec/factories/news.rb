FactoryBot.define do
  factory :news do
    title { Faker::Lorem.sentence }
    content { Faker:: Lorem.sentence }

    # ダミー画像
    after(:build) do |news|
      news.image.attach(io: File.open('public/images/dummy.png'), filename: 'test_image.png')
    end
  end
end
