require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '空の場合のテスト'
      it "画像がない場合は無効です" do
       item = build(:item, image:[] )
       item.valid?
       expect(item.errors[:image]).to include("を入力してください")
      end

      it "商品名がない場合は無効です" do
        item = build(:item, name: "")
        item.valid?
        expect(item.errors[:name]).to include("を入力してください")
      end

      it "商品説明がない場合は無効です" do
        item = build(:item, text: "")
        item.valid?
        expect(item.errors[:text]).to include("を入力してください")
      end

      it "カテゴリーがない場合は無効です" do
        item = build(:item, category_id: "")
        item.valid?
        expect(item.errors[:category_id]).to include("を入力してください")
      end

      it "商品の状態がない場合は無効です" do
        item = build(:item, product_id: "")
        item.valid?
        expect(item.errors[:product_id]).to include("を入力してください")
      end

      it "配送料の負担がない場合は無効です" do
        item = build(:item, delivery_id: "")
        item.valid?
        expect(item.errors[:delivery_id]).to include("を入力してください")
      end

      it "発送元の地域がない場合は無効です" do
        item = build(:item, area_id: "")
        item.valid?
        expect(item.errors[:area_id]).to include("を入力してください")
      end

      it "発送までの日数がない場合は無効です" do
        item = build(:item, days_id: "")
        item.valid?
        expect(item.errors[:days_id]).to include("を入力してください")
      end

      it "価格がない場合は無効です" do
        item = build(:item, price: "")
        item.valid?
        expect(item.errors[:price]).to include("を入力してください")
      end
    end

    context '価格が9999999円の場合' 
      it "有効な価格は最大9999999です" do
        item = build(:item, price: 9999999)
        expect(item).to be_valid
      end
    end

    context '価格が300円以下の場合'
      it "300円未満の場合は無効です" do
        item = build(:item, price: 299)
        item.valid?
        expect(item.errors[:price]).to include("は一覧にありません")
      end
    end

    context '価格が300円の場合'
      it "300円の場合は有効です"
        item = build(:item, price: 300)
        expect(item).to be_valid
      end
    end
  end
end
