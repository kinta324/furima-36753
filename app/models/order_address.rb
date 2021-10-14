class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :region_id, :city, :house_number, :building_name, :phone_number, :item_id, :user_id, :token, :product_histories_id

  validates :region_id, numericality: { other_than: 1 }
  
  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :city,presence: true
    validates :house_number,presence: true
    validates :phone_number, format: {with: /\A[0-9]{11}\z/ }
    validates :token
  end
  
  def save
    @order_address = Order.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, region_id: region_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, product_histories_id: @order_address)
  end
end