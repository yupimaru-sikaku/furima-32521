require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザー登録できる時' do
    it '全てのカラムが期待通りに存在すれば登録できること' do
      expect(@user).to be_valid
    end
  end

  context 'ユーザー登録できない時' do
    it 'passwordが空だと保存できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが6文字以上でないと保存できないこと' do
      @user.password = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordとpassword_confirmationが不一致では保存できないこと' do
      @user.password = '111aaa'
      @user.password_confirmation = '111bbb'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordが英字のみでは保存できないこと' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end

    it 'passwordが数字のみでは保存できないこと' do
      @user.password = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end

    it 'nicknameが空だと保存できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空だと保存できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'emailに@が存在しない場合登録できないこと' do
      @user.email = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'birthdayが空だと保存できないこと' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

    it 'last_nameが空だと保存できないこと' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'last_nameが全角でないと保存できないこと' do
      @user.last_name = 'ﾊﾝｶｸ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name Full-width characters')
    end

    it 'first_nameが空だと保存できないこと' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'first_nameが全角でないと保存できないこと' do
      @user.first_name = 'ﾊﾝｶｸ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name Full-width characters')
    end

    it 'last_name_readingが空だと保存できないこと' do
      @user.last_name_reading = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name reading can't be blank")
    end

    it 'last_name_readingが全角でないと保存できないこと' do
      @user.last_name_reading = 'ﾊﾝｶｸ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name reading Full-width katakana characters')
    end

    it 'first_name_readingが空だと保存できないこと' do
      @user.first_name_reading = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name reading can't be blank")
    end

    it 'first_name_readingが全角でないと保存できないこと' do
      @user.first_name_reading = 'ﾊﾝｶｸ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name reading Full-width katakana characters')
    end

    it 'first_name_readingがカタカナでないと保存できないこと' do
      @user.first_name_reading = '陸太郎'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name reading Full-width katakana characters')
    end
  end
end
