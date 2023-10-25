class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :purchase_item

  def index
    @item = Item.find(params[:item_id])  
    if current_user.id == @item.user_id
      redirect_to root_path
    else
    @purchase_order = PurchaseOrder.new
    end
  end

  def new
  end

  def create
    @item = Item.find(params[:item_id])  
    @purchase_order = PurchaseOrder.new(purchase_params)
    if @purchase_order.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
      Payjp::Charge.create(
        amount: @item.price, 
        card: purchase_params[:token],
        currency: 'jpy')
      @purchase_order.save
      return redirect_to root_path
    else
      render 'index'
    end
    
  end

  private

  def purchase_params
    params.require(:purchase_order)
    .permit(:post_number, :area_id, :city, :addresses, :order, :phone, :price)
    .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def purchase_item
    @item = Item.find(params[:item_id])  
    if @item.purchase.present? 
      redirect_to root_path
    end
  end

end
