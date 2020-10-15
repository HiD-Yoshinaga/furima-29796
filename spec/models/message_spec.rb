require 'rails_helper'

RSpec.describe Message, type: :model do
  describe '#create' do
    before do
      @message = FactoryBot.build(:message)
    end

    it 'Textとuser_idとitem_idが存在すれば登録できること' do
      expect(@message).to be_valid
    end

    it 'Textが空では登録できないこと' do
      @message.text = nil
      @message.valid?
      expect(@message.errors.full_messages).to include("Text can't be blank")
    end

    it 'userが紐付いていないと登録できないこと' do
      @message.user = nil
      @message.valid?
      expect(@message.errors.full_messages).to include("User must exist")
    end

    it 'itemが紐付いていないと登録できないこと' do
      @message.item = nil
      @message.valid?
      expect(@message.errors.full_messages).to include("Item must exist")
    end

  end
end
