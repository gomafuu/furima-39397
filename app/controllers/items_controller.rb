class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :no_match, only: [:edit]

  def index
    @items = Item.all.order("created_at DESC") 
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
      @item = Item.find(params[:id])
    end

    def edit
      @item = Item.find(params[:id])
    end

    def update
      @item = Item.find(params[:id])
      if @item.update(item_params)
      redirect_to item_path(@item)
      else
      render :edit
      end
    end

  private

  def item_params
    params.require(:item).
    permit(:image, :title, :detail, :category_id, 
      :condition_id, :delivery_id, :area_id, 
      :deliverydate_id, :price).
    merge(user_id: current_user.id)
  end

  def no_match
    @item = Item.find(params[:id])
    unless current_user.id == @item.user_id 
      redirect_to root_path
    end
  end
end
