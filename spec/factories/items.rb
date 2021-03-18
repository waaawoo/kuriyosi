FactoryBot.define do
  factory :item do
    name  { Faker::Name.initials }
    content { Faker::Lorem.sentence }
    price { 100 }
    sale_id { 1 }
    category_id { 1 }
    season_id { 1 }

    # ダミー画像
    after(:build) do |item|
      item.images.attach(io: File.open('public/images/dummy.png'), filename: 'test_image.png')
    end

  end
end
