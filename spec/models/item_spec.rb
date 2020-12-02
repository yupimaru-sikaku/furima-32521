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
    it 'imageが無けれな保存できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'nameが無ければ保存できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'descriptionが無ければ保存できないこと' do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'categoryが選択されていなければ保存できないこと' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Category Select')
    end

    it 'conditionが選択されていなければ保存できないこと' do
      @item.condition_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Condition Select')
    end

    it 'select_delivery_feeが選択されていなければ保存できないこと' do
      @item.select_delivery_fee_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Select delivery fee Select')
    end

    it 'prefectureが選択されていなければ保存できないこと' do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture Select')
    end

    it 'termが選択されていなければ保存できないこと' do
      @item.term_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Term Select')
    end

    it 'priceが空だと保存できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceが全角だと保存できないこと' do
      @item.price = '１２３４５'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Half-width number')
    end

    it 'priceが文字列だと保存できないこと' do
      @item.price = '値段'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Half-width number')
    end

    it 'priceの数値が300未満だとだと保存できないこと' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end

    it 'priceの数値が9999999より上だと保存できないこと' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end
  end
end
