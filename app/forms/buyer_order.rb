class BuyerOrder

  include ActiveModel::Model
  attr_accessor :post_number, :prefectures_id, :city, :address, :building_name, :phone_number, :token ,:order_id, :user_id, :item_id
  
  validates :prefectures_id,:city,:address, presence: true
  validates :phone_number, presence: true, format: {with: /\A\d{11}\z/}
  validates :post_number, presence: true, format: {with: /\A\d{3}[-]\d{4}\z/}
  validates :prefectures_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Buyer.create!(post_number: post_number, prefectures_id: prefectures_id, city: city, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end