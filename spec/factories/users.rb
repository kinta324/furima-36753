FactoryBot.define do
  factory :user do
    name                  { "yamada" }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { "ぜんかく" }
    family_name           { "ぜんかく" }
    first_name_kana       { "ゼンカクカナ" }
    family_name_kana        { "ゼンカクカナ" }
    birth_day             { "2020-01-01" }
  end
end