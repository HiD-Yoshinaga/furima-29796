require 'rails_helper'

RSpec.describe OrderOrderInfo, type: :model do
  describe '購入情報の保存' do
    before do
      @order_order_info = FactoryBot.build(:order_order_info)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_order_info).to be_valid
    end
    it 'tokenが空だと保存できないこと' do
      @order_order_info.token = nil
      @order_order_info.valid?
      expect(@order_order_info.errors.full_messages).to include("Token can't be blank")
    end
    it 'postcodeが空だと保存できないこと' do
      @order_order_info.postcode = nil
      @order_order_info.valid?
      expect(@order_order_info.errors.full_messages).to include("Postcode can't be blank")
    end
    it 'postcodeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @order_order_info.postcode = '1234567'
      @order_order_info.valid?
      expect(@order_order_info.errors.full_messages).to include("Postcode is invalid. Include hyphen(-)")
    end
    it 'shipping_address_idを選択していないと保存できないこと' do
      @order_order_info.shipping_address_id = 1
      @order_order_info.valid?
      expect(@order_order_info.errors.full_messages).to include("Shipping address can't be blank")
    end
    it 'cityが空だと保存できないこと' do
      @order_order_info.city = nil
      @order_order_info.valid?
      expect(@order_order_info.errors.full_messages).to include("City can't be blank")
    end
    it 'house_numberが空だと保存できないこと' do
      @order_order_info.house_number = nil
      @order_order_info.valid?
      expect(@order_order_info.errors.full_messages).to include("House number can't be blank")
    end
    it 'building_nameは空でも保存できること' do
      @order_order_info.building_name = nil
      expect(@order_order_info).to be_valid
    end
    it 'phone_numberが空だと保存できないこと' do
      @order_order_info.phone_number = nil
      @order_order_info.valid?
      expect(@order_order_info.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberが半角でないと保存できないこと' do
      @order_order_info.phone_number = '０８０１２３４１２３４'
      @order_order_info.valid?
      expect(@order_order_info.errors.full_messages).to include("Phone number is invalid")
    end
  end
end
