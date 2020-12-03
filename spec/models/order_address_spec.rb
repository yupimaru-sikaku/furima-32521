require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  context 'ユーザー登録できる時' do
    it '全てのカラムが期待通りに存在すれば登録できること' do
      expect(@order_address).to be_valid
    end

    it 'building_nameが空でも登録できること' do
      @order_address.building_name = nil
      expect(@order_address).to be_valid
    end
  end

  context 'ユーザー登録できない時' do
    it 'tokenが空では保存できないこと' do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("クレジットカード情報を入力してください")
    end

    it 'postal_codeが空では保存できないこと' do
      @order_address.postal_code = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("郵便番号を入力してください")
    end

    it 'postal_codeに-が無けれな保存できないこと' do
      @order_address.postal_code = '1111111'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('郵便番号は"-"を含めて下さい')
    end

    it 'prefectureが選択されていなければ保存できないこと' do
      @order_address.prefecture_id = 0
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('都道府県を選択して下さい')
    end

    it 'cityが空では保存できないこと' do
      @order_address.city = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("市町村区を入力してください")
    end

    it 'house_numberが空では保存できないこと' do
      @order_address.house_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("番地を入力してください")
    end

    it 'phone_numberが空では保存できないこと' do
      @order_address.phone_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("電話番号を入力してください")
    end

    it 'phone_numberに数字以外が入力されていない保存できないこと' do
      @order_address.phone_number = '電話だよ'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('電話番号は数字のみで入力して下さい')
    end

    it 'phone_numberが12桁以上では保存できないこと' do
      @order_address.phone_number = '1122334455667'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('電話番号は12文字以内で入力してください')
    end
  end
end
