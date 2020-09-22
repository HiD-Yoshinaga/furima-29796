require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'nicknameとemail、passwordとpassword_confirmationとbirthdayとfirst_nameとfamily_nameとfirst_name_kanaとfamily_name_kanaが存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailに一意性がないと登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'emailに@がないと登録できない' do
      @user.email = 'sampleemail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'passwordが空では登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordが6文字以上であれば登録できること' do
      @user.password = '123456A'
      @user.encrypted_password = '123456A'
      expect(@user).to be_valid
    end

    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = '1234A'
      @user.encrypted_password = '1234A'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordは半角数字のみでは登録できないこと' do
      @user.password = '123456'
      @user.encrypted_password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Encrypted password パスワードには英字と数字の両方を含めて設定してください')
    end

    it 'passwordは半角英字のみでは登録できないこと' do
      @user.password = 'password'
      @user.encrypted_password = 'password'
      @user.valid?
      expect(@user.errors.full_messages).to include('Encrypted password パスワードには英字と数字の両方を含めて設定してください')
    end

    it 'first_nameは漢字・ひらがな・カタカナでなければ登録できないこと' do
      @user.first_name = 'Taro'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name 全角文字を使用してください')
    end

    it 'family_nameは漢字・ひらがな・カタカナでなければ登録できないこと' do
      @user.family_name = 'Furima'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name 全角文字を使用してください')
    end

    it 'first_name_kanaはカタカナでなければ登録できないこと' do
      @user.first_name_kana = '太郎'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana 全角カタカナを使用してください')
    end

    it 'family_name_kanaはカタカナでなければ登録できないこと' do
      @user.family_name_kana = 'ふりま'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name kana 全角カタカナを使用してください')
    end
  end
end
