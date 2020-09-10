class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :move_to_root_path, only: [:index]
  def index
    @purchases = Purchase.order('created_at DESC')
    @purchase = UserPurchase.new
  end

  def create
    @purchase = UserPurchase.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.permit(:postal_number, :city, :address, :building, :phone_number, :prefecture_id, :token, :item_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_root_path
    @item = Item.find(params[:item_id])
    redirect_to root_path unless user_signed_in? && @item.user_id == current_user.id && @item.user_id != current_user.id 
  end
end
