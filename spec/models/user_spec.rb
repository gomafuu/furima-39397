require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
        # expect=除外 @userを除外する
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = '12345gmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'Email has already been taken'
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it '英字のみのパスワードでは登録できない' do
        @user.password = 'aaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '数字のみのパスワードでは登録できない' do
        @user.password = '11111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'ああああああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'お名前(全角)の、名字が空では登録できない' do
        @user.name_last = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name last can't be blank")
      end
      it 'お名前(全角)の、名字がかな、漢字、カナ以外では登録できない' do
        @user.name_last = /[a-z]/
        @user.valid?
        expect(@user.errors.full_messages).to include('Name last is invalid')
      end
      it 'お名前(全角)の、名前が空では登録できない' do
        @user.name_first = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name first can't be blank")
      end
      it 'お名前(全角)の、名前ががかな、漢字、カナ以外登録できない' do
        @user.name_first = /[a-z]/
        @user.valid?
        expect(@user.errors.full_messages).to include('Name first is invalid')
      end
      it 'お名前カナ(全角)の、名前が空では登録できない' do
        @user.kana_first = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first can't be blank")
      end
      it 'お名前カナ(全角)の、名前がカナ以外だと登録できない' do
        @user.kana_first = /[ぁ-んa-z一-龥々]/
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana first is invalid')
      end
      it 'お名前カナ(全角)の、名前が空では登録できない' do
        @user.kana_first = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first can't be blank")
      end
      it 'お名前カナ(全角)の、名前がカナ以外では登録できない' do
        @user.kana_first = /[ぁ-んa-z一-龥々]/
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana first is invalid')
      end
      it '生年月日が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
