FactoryBot.define do
  factory :store do

    name { Faker::Name.initials }
    phone { 1212341234 }
    address { Faker::Address.name }
    open_time{ Faker::Time.backward(days: 14, period: :evening) }
    close_time { Faker::Time.backward(days: 14, period: :evening) }
    holiday_id { 2 }

    # ダミー画像
    after(:build) do |store|
      store.images.attach(io: File.open('public/images/dummy.png'), filename: 'test_image.png')
    end
  end
end
