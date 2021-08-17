FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.free_email}
    password              {'qw1234'}
    password_confirmation {'qw1234'}
    family_name           {'仲谷'}
    first_name            {'将幸'}
    family_name_katakana  {'ナカタニ'}
    first_name_katakana   {'マサユキ'}
    birthday              {'1992-09-26'}
  end
end