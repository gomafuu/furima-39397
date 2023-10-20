class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :no_match, only: [:edit]
  before_action :set_item, only: [:edit, :show, :update, :no_match, :destroy]


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
  end

    def edit
    end

    def update
      if @item.update(item_params)
      redirect_to item_path(@item)
      else
      render :edit
      end
    end

    def destroy
      if current_user.id == @item.user_id
        @item.destroy
      end
      redirect_to root_path
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
    unless current_user.id == @item.user_id 
      redirect_to root_path
    end
  end


  def set_item
    @item = Item.find(params[:id])  
  end
end
