class BuyerController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
  end

  def new
    @buyer = BuyerOrder.new
  end

  def create
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
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: @item.price,  
      card: buyer_params[:token],    
      currency:'jpy'                
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
