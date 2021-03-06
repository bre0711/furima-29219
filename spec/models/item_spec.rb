require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.images.attach(io: File.open('public/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
  end

  describe '商品の出品' do
    context '出品ができる場合' do
      it 'ログインした状態で商品画像、商品名、商品説明、カテゴリー、商品の状態、配送料の負担、発送元の地域、発送までの日数、販売価格が入力されていれば出品できる' do
        expect(@item).to be_valid
      end
      # it '商品画像があれば出品できる' do
      #   expect(@item.images.blobs).to be_valid
      # end
      it '商品名があれば出品できる' do
        @item.name = '机'
        expect(@item).to be_valid
      end
      it '商品説明があれば出品できる' do
        @item.description = '黒くて大きい机です'
        expect(@item).to be_valid
      end
      it 'カテゴリーに情報があれば出品できる' do
        @item.category_id = 2
        expect(@item).to be_valid
      end
      it '商品の状態についての情報があれば出品できる' do
        @item.state_id = 3
        expect(@item).to be_valid
      end
      it '配送料の負担についての情報があれば出品できる' do
        @item.burden_id = 2
        expect(@item).to be_valid
      end
      it '発送元の地域についての情報があれば登録できる' do
        @item.area_id = 25
        expect(@item).to be_valid
      end
      it '発送までの日数についての情報があれば登録できる' do
        @item.shipping_id = 2
        expect(@item).to be_valid
      end
      it '価格の範囲が¥300~¥9,999,999の間であれば出品できる' do
        @item.price = 11_111
        expect(@item).to be_valid
      end
    end

    context '出品がうまくいかないとき' do
      it '商品画像が空では出品できない' do
        @item.images = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("出品画像を入力してください")
      end
      it '商品名が空では出品できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it '商品の説明が空では出品できない' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品説明を入力してください")
      end
      it 'カテゴリーが空では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
      end
      it '商品の状態が空では出品できない' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を入力してください")
      end
      it '配送料の負担が空では登録できない' do
        @item.burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
      end
      it '発送元の地域が空では登録できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
      end
      it '発送までの日数が空では登録できない' do
        @item.shipping_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
      end
      it '販売価格が空では登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は300円〜9,999,999円です", "販売価格を入力してください")
      end
      it '販売価格が299円以下だと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は300円〜9,999,999円です")
      end
      it '販売価格が10,000,000円以上だと出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は300円〜9,999,999円です")
      end
      it '販売価格は半角数字でないと出品できない' do
        @item.price = '２０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は300円〜9,999,999円です")
      end
    end
  end
end
