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
      it 'nicknameが空では登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空では登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'emailに@がついていないと登録できない' do
        @user.email = 'testgmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it 'passwordが空では登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください", "パスワードは英数字が混合した６文字以上のパスワードにしてください", "パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = 'aA000'
        @user.password_confirmation = 'aA000'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it 'passwordが英数字混合でなければ登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは英数字が混合した６文字以上のパスワードにしてください")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前（名字）を入力してください", "お名前（名字）は全角文字を使用してください")
      end
      it 'first_nameが全角かな/カナ漢字以外だと登録でき' do
        @user.first_name = 'jack'
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前（名字）は全角文字を使用してください")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前（名前）を入力してください", "お名前（名前）は全角文字を使用してください")
      end
      it 'last_nameが全角かな/カナ漢字以外だと登録できない' do
        @user.last_name = 'mike'
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前（名前）は全角文字を使用してください")
      end
      it 'first_kana_nameが空では登録できない' do
        @user.first_kana_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ（名字）を入力してください", "お名前カナ（名字）は全角カタカナで入力してください")
      end
      it 'first_kana_nameが全角カナ以外だと登録できない' do
        @user.first_kana_name = '佐藤'
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ（名字）は全角カタカナで入力してください")
      end
      it 'last_kana_nameが空では登録できない' do
        @user.last_kana_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ（名前）を入力してください", "お名前カナ（名前）は全角カタカナで入力してください")
      end
      it 'first_kana_nameが全角カナ以外だと登録できない' do
        @user.last_kana_name = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ（名前）は全角カタカナで入力してください")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
    end
  end
end
