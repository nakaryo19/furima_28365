require 'rails_helper'

RSpec.describe BuyerOrder, type: :model do
  describe '購入画面のテスト' do
    before do
      @buyer_order = FactoryBot.build(:buyer_order)
    end

    context 'バリデーションのテスト' do
      it "全ての値が入力されている場合保存できること" do
        expect(@buyer_order).to be_valid
      end

      it "郵便番号が空の場合は無効です" do
        @buyer_order.post_number = nil
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include("Post number can't be blank", "Post number is invalid")
      end

      it "都道府県がない場合は無効です" do
        @buyer_order.prefectures_id = nil
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include("Prefectures can't be blank", "Prefectures can't be blank")
      end

      it "市区町村がない場合は無効です" do
        @buyer_order.city = nil
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include("City can't be blank")
      end

      it "番地がない場合は無効です" do
        @buyer_order.address = nil
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include("Address can't be blank")
      end

      it "電話番号がない場合は無効です" do
        @buyer_order.phone_number = nil
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
      end

      it '郵便番号が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @buyer_order.post_number = '1234567'
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include("Post number is invalid")
      end

      it '都道府県を選択していないと保存できないこと' do
        @buyer_order.prefectures_id = 0
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include("Prefectures can't be blank")
      end

      it '電話番号がハイフンなしで11桁以内でないと保存できないこと' do
        @buyer_order.phone_number = '080-5353-5353'
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end
