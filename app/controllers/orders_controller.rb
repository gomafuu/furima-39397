class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])  
    @order = Order.new
  end

  def new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order).permit(:card_number, :card_month,
    :card_year, :card_cvc, :post_number, :area_id,
    :city, :addresses, :bilding, :phone)
  end

end
