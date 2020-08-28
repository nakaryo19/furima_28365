class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category 
  belongs_to_active_hash :product
  belongs_to_active_hash :delivery
  belongs_to_active_hash :area
  belongs_to_active_hash :days

  belongs_to :user
  has_one :order
  has_one_attached :image

  validates :name,:text,:image,:category_id,:product_id,:delivery_id,:area_id,:days_id, presence: true
  validates :price, presence: true, inclusion: 300..9999999
end
