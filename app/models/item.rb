class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions  

  belongs_to :user
  #has_one    :purchase
  has_one_attached :image

  with_options presence: true do
    validates :name, presence: true
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :category_id, numericality: { other_than: 1 } 
    validates :postage_id, numericality: { other_than: 1 } 
    validates :region_id, numericality: { other_than: 1 } 
    validates :shipping_date_id, numericality: { other_than: 1 } 
    validates :item_condition_id, numericality: { other_than: 1 } 
    validates :description, presence: true 
    validates :image, presence: true
  end
end
