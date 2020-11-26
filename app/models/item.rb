class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :product_condition
  belongs_to_active_hash :shipping_price
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_date

  validates :image, presence: true
  validates :product_name, presence: true
  validates :text, presence: true
  validates :category_id, presence: true
  validates :product_condition_id, presence: true
  validates :shipping_price_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipping_date_id, presence: true
  validates :price, presence: true
  validates :price, inclusion: { in: 300..9999999 }
  validates :price, format: { with: /\A[0-9]+\z/ }


  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :product_condition_id
    validates :shipping_price_id
    validates :prefecture_id
    validates :shipping_date_id
  end
end
