class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end

    # def show
    # end

  end

  private

  def item_params
    params.require(:item).
    permit(:image, :title, :detail, :category_id, :condition_id, :delivery_id, :area_id, :deliverydate_id, :price,)
  end
end
