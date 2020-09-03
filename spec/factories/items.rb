FactoryBot.define do
  factory :item do
    name          { 'ぬいぐるみ' }
    description   { 'クマのぬいぐるみです' }
    category_id   { 3 }
    state_id      { 3 }
    burden_id     { 4 }
    area_id       { 2 }
    shipping_id   { 4 }
    price         { 10_000 }
    user_id       { 1 }
    association :user
  end
end
