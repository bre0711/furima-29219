require 'rails_helper'
RSpec.describe Purchase, type: :model do
  before do
    @purchase = FactoryBot.build(:user_purchase)
  end

  describe '商品の購入' do
    context '出品ができる場合' do
      it 'ログインした状態でカード情報、郵便番号、都道府県、市区町村、番地、建物名、電話番号が入力されていれば購入できる' do
        expect(@purchase).to be_valid
      end
      it '郵便番号があれば出品できる' do
        @purchase.postal_number = '111-1111'
        expect(@purchase).to be_valid
      end
      it '都道府県があれば出品できる' do
        @purchase.prefecture_id = 5
        expect(@purchase).to be_valid
      end
      it '市区町村があれば出品できる' do
        @purchase.city = '名古屋市千種区'
        expect(@purchase).to be_valid
      end
      it '番地があれば出品できる' do
        @purchase.address = '５丁目３番地'
        expect(@purchase).to be_valid
      end
      it '電話番号があれば出品できる' do
        @purchase.phone_number = '08077665544'
        expect(@purchase).to be_valid
      end
    end

    context '購入がうまくいかないとき' do
      it 'トークンがないと購入できない' do
        @purchase.token = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空では購入できない' do
        @purchase.postal_number = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Postal number ハイフン有りの7桁の数字でで入力してください', "Postal number can't be blank")
      end
      it '都道府県が空では購入できない' do
        @purchase.prefecture_id = 1
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it '市区町村が空では購入できない' do
        @purchase.city = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では購入できない' do
        @purchase.address = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空では購入できない' do
        @purchase.phone_number = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Phone number ハイフン無しの11桁以内で入力してください', "Phone number can't be blank")
      end
      it '郵便番号にハイフンがないと購入できない' do
        @purchase.postal_number = '4844433'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Postal number ハイフン有りの7桁の数字でで入力してください')
      end
      it '電話番号にハイフンがあると購入できない' do
        @purchase.phone_number = '0120-44-3322'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Phone number ハイフン無しの11桁以内で入力してください')
      end
    end
  end
end
