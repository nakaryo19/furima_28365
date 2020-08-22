require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.png')
    end

    context '空の場合のテスト' do
      it "画像がない場合は無効です" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "商品名がない場合は無効です" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "商品説明がない場合は無効です" do
        @item.text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end

      it "カテゴリーがない場合は無効です" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it "商品の状態がない場合は無効です" do
        @item.product_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Product can't be blank")
      end

      it "配送料の負担がない場合は無効です" do
        @item.delivery_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery can't be blank")
      end

      it "発送元の地域がない場合は無効です" do
        @item.area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end

      it "発送までの日数がない場合は無効です" do
        @item.days_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Days can't be blank")
      end

      it "価格がない場合は無効です" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", "Price is not included in the list")
      end
    end

    context '価格が9999999円の場合' do
      it "有効な価格は最大9999999です" do
        @item.price = "9999999"
        expect(@item).to be_valid
      end
    end

    context '価格が300円以下の場合' do
      it "300円未満の場合は無効です" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the listhu")
      end
    end

    context '価格が300円の場合' do
      it "300円の場合は有効です" do
        @item.price = "300"
        expect(@item).to be_valid
      end
    end
  end
end
