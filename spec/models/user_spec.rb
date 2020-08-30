require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録ができる場合' do
      it 'nameとemail、passwordとpassword_confirmationとfirst_nameとlast_nameとfirst_kana_nameとlast_kana_nameとbirthdayが存在すれば登録できること' do
        expect(@user).to be_valid
      end
      it 'nicknameが1文字以上で登録できる' do
        @user.nickname = 'a'
        expect(@user).to be_valid
      end
      it 'passwordが英数字混合の6文字以上であれば登録できる' do
        @user.password = 'aA12Bb'
        @user.password_confirmation = 'aA12Bb'
        expect(@user).to be_valid
      end
      it 'first_nameが全角かな/カナ漢字であれば登録できる' do
        @user.first_name = '佐藤'
        expect(@user).to be_valid
      end
      it 'last_nameが全角かな/カナ漢字であれば登録できる' do
        @user.last_name = '五郎'
        expect(@user).to be_valid
      end
      it 'first_kana_nameが全角カナであれば登録できる' do
        @user.first_kana_name = 'ヤマダ'
        expect(@user).to be_valid
      end
      it 'last_kana_nameが全角カナであれば登録できる' do
        @user.last_kana_name = 'タロウ'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
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
      it 'emailに@がついていないと登録できない' do
        @user.email = 'testgmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できないこと' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = 'aA000'
        @user.password_confirmation = 'aA000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'first_nameが空では登録できないこと' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", 'First name 全角文字を使用してください')
      end
      it 'first_nameが全角かな/カナ漢字以外だと登録できない' do
        @user.first_name = 'jack'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name 全角文字を使用してください')
      end
      it 'last_nameが空では登録できないこと' do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", 'Last name 全角文字を使用してください')
      end
      it 'last_nameが全角かな/カナ漢字以外だと登録できない' do
        @user.last_name = 'mike'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name 全角文字を使用してください')
      end
      it 'first_kana_nameが空では登録できないこと' do
        @user.first_kana_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana name can't be blank", 'First kana name 全角カタカナで入力してください')
      end
      it 'first_kana_nameが全角カナ以外だと登録できない' do
        @user.first_kana_name = '佐藤'
        @user.valid?
        expect(@user.errors.full_messages).to include('First kana name 全角カタカナで入力してください')
      end
      it 'last_kana_nameが空では登録できないこと' do
        @user.last_kana_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana name can't be blank", 'Last kana name 全角カタカナで入力してください')
      end
      it 'first_kana_nameが全角カナ以外だと登録できない' do
        @user.last_kana_name = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last kana name 全角カタカナで入力してください')
      end
      it 'birthdayが空では登録できないこと' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
