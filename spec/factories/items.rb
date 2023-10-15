FactoryBot.define do
  factory :item do
    title              { Faker::Lorem.sentence}
    detail              { Faker::Lorem.sentence }
    price              { Faker::Number.number(digits: 5) }
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'your_image.jpg')
    end

    category_id             { 2 }
    condition_id            { 2 }
    delivery_id             { 2 }
    area_id                 { 2 }
    deliverydate_id         { 2 }
  end
end