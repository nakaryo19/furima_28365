class BuyerController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @buyer = BuyerOrder.new
  end

  def create
    @item = Item.find(params[:item_id])
    @buyer = BuyerOrder.new(buyer_params)
    if @buyer.valid?
      pay_item
      @buyer.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyer_params
    params.permit(:post_number, :prefectures_id, :city, :address, :building_name, :phone_number, :token, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: buyer_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

end
