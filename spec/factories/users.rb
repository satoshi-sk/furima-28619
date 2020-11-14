FactoryBot.define do
  factory :user do
    nickname              { 'abebe' }
    email                 { 'sample@com' }
    password              { '123abc' }
    password_confirmation { '123abc' }
    last_name             { '山田' }
    first_name            { '太郎' }
    last_name_kana        { 'ヤマダ' }
    first_name_kana       { 'タロウ' }
    birthday              { '1985-01-01' }
  end
end
