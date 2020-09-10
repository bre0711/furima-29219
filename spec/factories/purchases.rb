FactoryBot.define do
  factory :user_purchase do
    postal_number        { '123-4567' }
    city                 { '横浜市緑区' }
    address              { '青山1-1-1' }
    building             { '柳ビル' }
    phone_number         { '09012345678' }
    prefecture_id        { 3 }
    token                { 'sk_test_e9e6746791736f94f3cd91f6' }
  end
end
