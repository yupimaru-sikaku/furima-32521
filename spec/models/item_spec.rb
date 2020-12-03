require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context 'ユーザー登録できる時' do
    it '全てのカラムが期待通りに存在すれば登録できること' do
      expect(@item).to be_valid
    end
  end

  context 'ユーザー登録できない時' do
    it 'imagesが無けれな保存できないこと' do
      @item.images = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("画像を入力してください")
    end

    it 'nameが無ければ保存できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("商品名を入力してください")
    end

    it 'descriptionが無ければ保存できないこと' do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の説明を入力してください")
    end

    it 'categoryが選択されていなければ保存できないこと' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('カテゴリーを選択して下さい')
    end

    it 'conditionが選択されていなければ保存できないこと' do
      @item.condition_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('商品の状態を選択して下さい')
    end

    it 'select_delivery_feeが選択されていなければ保存できないこと' do
      @item.select_delivery_fee_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('配送料の負担を選択して下さい')
    end

    it 'prefectureが選択されていなければ保存できないこと' do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('都道府県を選択して下さい')
    end

    it 'termが選択されていなければ保存できないこと' do
      @item.term_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('発送までの日数を選択して下さい')
    end

    it 'priceが空だと保存できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("販売価格を入力してください")
    end

    it 'priceが全角だと保存できないこと' do
      @item.price = '１２３４５'
      @item.valid?
      expect(@item.errors.full_messages).to include('販売価格は半角数字で入力して下さい')
    end

    it 'priceが文字列だと保存できないこと' do
      @item.price = '値段'
      @item.valid?
      expect(@item.errors.full_messages).to include('販売価格は半角数字で入力して下さい')
    end

    it 'priceの数値が300未満だとだと保存できないこと' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('販売価格が範囲外です')
    end

    it 'priceの数値が9999999より上だと保存できないこと' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('販売価格が範囲外です')
    end
  end
end
