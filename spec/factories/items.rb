FactoryBot.define do
  factory :item do
    name          {"名前"}
    price           {2000}
    item_condition_id  {2}
    postage_id         {2}
    category_id        {2}
    description           {"説明"}
    region_id          {2}
    shipping_date_id   {2}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')
    end
  end
end