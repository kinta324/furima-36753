class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions  

  belongs_to :user
  #has_one    :purchase
  has_one_attached :image

  with_options presence: true do
    validates :name, presence: true
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :category_id, presence: true
    validates :postage_id, presence: true
    validates :region_id, presence: true
    validates :shipping_date_id, presence: true
    validates :item_condition_id, presence: true
    validates :description, presence: true
    validates :image, presence: true
  end
end
