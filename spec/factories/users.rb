FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }

    name_last             { '佐藤' }
    name_first            { 'みか' }
    kana_last             { 'サトウ' }
    kana_first            { 'ミカ' }
    birthday              { '1960-12-31' }
  end
end
