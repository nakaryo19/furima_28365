class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :create, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except:[:index, :show]
  # before_action :search_item, only: [:index, :search]

  def index
    @items = Item.all.order("created_at DESC")
    @parents = Storage.where(ancestry: nil)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.user_id == current_user.id
      if @item.update(item_params)
        redirect_to item_path(@item.id)
      else
        redirect_to action: :edit
      end
    else
      redirect_to action: :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path, notice: '削除しました'
    else
      render :show
    end
  end

  # def search
  #   @results = @p.result.includes(:storage) 
  # end

  private
  def item_params
    params.require(:item).permit(:name, :text, :image, :category_id, :product_id, :delivery_id, :area_id, :days_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  # def search_item
  #   @p = Item.ransack(params[:q]) 
  # end
end
