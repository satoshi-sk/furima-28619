class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :product_condition
  belongs_to_active_hash :shipping_price
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_date

  with_options presence: true do
    validates :image
    validates :product_name
    validates :text
    validates :category_id
    validates :product_condition_id
    validates :shipping_price_id
    validates :prefecture_id
    validates :shipping_date_id
    validates :price
  end

  validates :price, inclusion: { in: 300..9_999_999 }
  validates :price, format: { with: /\A[0-9]+\z/ }

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :product_condition_id
    validates :shipping_price_id
    validates :prefecture_id
    validates :shipping_date_id
  end
end
