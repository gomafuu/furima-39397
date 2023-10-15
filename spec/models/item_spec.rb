require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

describe '商品出品' do
  context '商品出品できるとき' do
    it 'titleとdetail,category_idとcondition_id,
    delivery_id,area_id,deliverydate_id,price が存在すれば登録できる' do
      expect(@item).to be_valid
    end
  end
  context '商品出品できないとき' do
    it 'imageが空では登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Image can't be blank"
    end
    it 'titleが空では登録できない' do
      @item.title = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Title can't be blank"
    end
    it 'detailが空では登録できない' do
      @item.detail = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Detail can't be blank"
    end
    it 'category_idが空では登録できない' do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include "Category can't be blank"
    end
    it 'condition_idが空では登録できない' do
      @item.condition_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include "Condition can't be blank"
    end
    it 'delivery_idが空では登録できない' do
      @item.delivery_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include "Delivery can't be blank"
    end
    it 'area_idが空では登録できない' do
      @item.area_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include "Area can't be blank"
    end
    it 'deliverydate_idが空では登録できない' do
      @item.deliverydate_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include "Deliverydate can't be blank"
    end
    it 'priceが空では登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Price can't be blank"
    end
    it 'priceが300未満では登録できない' do
      @item.price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
    end
    it 'priceが10,000,000以上では登録できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
    end
    it 'priceが半角数値以外では登録できない' do
      @item.price = /[０-９]/
      @item.valid?
      expect(@item.errors.full_messages).to include "Price can't be blank"
    end
    it 'userが紐づいていない場合は登録できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "User must exist"
    end
  end
end
end