class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show]
  before_action :set_user, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show]
  def index
    @items = Item.includes(:user).order("created_at DESC")
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
    item = Item.find(params[:id])
    item.update(item_params)
  end


  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :state_id, :burden_id, :area_id, :shipping_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_user
    @user = User.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
