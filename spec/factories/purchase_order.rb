FactoryBot.define do
  factory :purchase_order do
    post_number     {'123-4567'}
    area_id         {2}
    city            {'広島市'}
    addresses       {'1-2'}
    building         {'広島ビル'}
    phone           {'12345678910'}
    item_id         {2}
    token           {'tok_a044d8fa65fcd7ae09ea0df63de7'}
  end
end
