require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it 'Imageとitem_nameとitem_infoとitem_priceとitem_category_idとitem_condition_idとshipping_fee_idとship_from_idとday_to_ship_idが存在すれば登録できること' do
      expect(@item).to be_valid
    end

    it 'Imageが空では登録できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'item_nameが空では登録できないこと' do
      @item.item_name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end

    it 'item_infoが空では登録できないこと' do
      @item.item_info = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item info can't be blank")
    end

    it 'item_priceが空では登録できないこと' do
      @item.item_price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item price can't be blank")
    end

    it 'item_category_idが1では登録できないこと' do
      @item.item_category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('Item categories must be other than 1')
    end

    it 'item_condition_idが1では登録できないこと' do
      @item.item_condition_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('Item condition must be other than 1')
    end

    it 'shipping_fee_idが1では登録できないこと' do
      @item.shipping_fee_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping fee must be other than 1')
    end

    it 'ship_from_idが1では登録できないこと' do
      @item.ship_from_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('Ship from must be other than 1')
    end

    it 'day_to_ship_idが1では登録できないこと' do
      @item.day_to_ship_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('Day to ship must be other than 1')
    end

    it 'item_priceが300円未満では登録できないこと' do
      @item.item_price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include('Item price 金額が¥300~9,999,999の範囲外です')
    end

    it 'item_priceが10,000,000円以上では登録できないこと' do
      @item.item_price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include('Item price 金額が¥300~9,999,999の範囲外です')
    end

    it 'item_priceが全角では登録できないこと' do
      @item.item_price = '１０００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Item price 金額が¥300~9,999,999の範囲外です')
    end
  end
end
