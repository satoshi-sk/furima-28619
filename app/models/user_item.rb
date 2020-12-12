class UserItem
  include AcriveModel::Model
  attr_accessor :token, :@item.id, :@user.id, :post_code, :prefecture_id, :city, :block_number, :building_name, :phone_number

  with_options presence: true do
    validates :token
    validates :post_code
    validates :city
    validates :block_number
    validates :phone_number
  end
  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    Order.create(user_id: @user.id, item_id:@item.id)
    Shipping_address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, block_number: block_number, building_name: building_name, phone_number: phone_number)
  end
end
