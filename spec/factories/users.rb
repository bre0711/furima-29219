FactoryBot.define do
  factory :user do
    nickname              { 'abe' }
    email                 { 'kkk@gmail.com' }
    password              { 'aA01Bb' }
    password_confirmation { password }
    first_name            { '山田' }
    last_name             { '太郎' }
    first_kana_name       { 'ヤマダ' }
    last_kana_name        { 'タロウ' }
    birthday              { '1991-07-02' }
  end
end
