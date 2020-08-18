class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items
  has_many :orders

  validates :nickname,:birthday, presence: true
  validates :family_name,:first_name, presence:true, format: {with: /\A[ぁ-んァ-ン一-龥]/}
  validates :family_name_kana,:first_name_kana, presence:true, format: {with: /\A[ァ-ヶー－]+\z/}
  validates :password, format: {with: /\A[a-z0-9]+\z/i}
end
