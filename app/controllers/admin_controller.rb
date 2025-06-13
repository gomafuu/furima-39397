class AdminController < ApplicationController
  def delete_items
    Item.destroy_all
    redirect_to root_path, notice: '全ての出品データを削除しました。'
  end
end
