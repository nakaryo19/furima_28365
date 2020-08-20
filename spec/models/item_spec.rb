require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '空の場合のテスト'
      it "画像なしは無効です" do
       item = build(:item, image:[] )
       item.valid?
       expect(product.errors[:image]).to include("を入力してください")
      end

    it '名前なしは無効です' do
      
  
end
