FactoryBot.define do
  factory :address do
    post_code       {'200-2000'}
    region_id           {2}
    city              {"東京都"}
    house_number         {"青山1"}
    building_name     {"ビル211"}
    phone_number         {'08000000000'}
    token             {'tok_abcdefghijk00000000000000000'}
    association :user ,:item
  end
end
