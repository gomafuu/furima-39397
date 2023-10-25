require 'rails_helper'

RSpec.describe PurchaseOrder, type: :model do
  before do
    user = FactoryBot.create(:user)
    @purchase_order = FactoryBot.build(:purchase_order, user_id: user.id)
  end

  describe '購入情報と住所の保存' do
    context '内容に問題ない場合' do
      it 'post_number,area_id,city,addresses,
      building,phone が存在すれば保存できること' do
      expect(@purchase_order).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @purchase_order.building = ''
        expect(@purchase_order).to be_valid
      end
    end

    context '内容に問題があるとき' do
      it 'post_numberが空では登録できない' do
        @purchase_order.post_number = nil
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include "Post number can't be blank"
      end
      it 'post_numberが3-4桁でハイフンがないと登録できない' do
        @purchase_order.post_number = '123456'
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include "Post number is invalid"
      end
      it 'area_idが空では登録できない' do
        @purchase_order.area_id = '1'
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include "Area can't be blank"
      end
      it 'citiyが空では登録できない' do
        @purchase_order.city = ''
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include "City can't be blank"
      end
      it 'addressesが空では登録できない' do
        @purchase_order.addresses = ''
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include "Addresses can't be blank"
      end
      it 'phoneが空では登録できない' do
        @purchase_order.phone = ''
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include "Phone can't be blank"
      end
      it 'phoneが10桁以上11以内で半角でないと登録できない' do
        @purchase_order.phone = '０９０１２３４５６７'
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include "Phone is invalid"
      end
      it 'tokenが空では登録できない' do
        @purchase_order.token = ''
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include "Token can't be blank"
      end
    end
  end
end
