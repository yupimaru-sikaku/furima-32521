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
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end

    it 'passwordが6文字以上でないと保存できないこと' do
      @user.password = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
    end
    
    it 'passwordとpassword_confirmationが不一致では保存できないこと' do
      @user.password = '111aaa'
      @user.password_confirmation = '111bbb'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end
    
    it 'passwordが英字のみでは保存できないこと' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは文字と数字の両方を含めて下さい')
    end
    
    it 'passwordが数字のみでは保存できないこと' do
      @user.password = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは文字と数字の両方を含めて下さい')
    end
    
    it 'nicknameが空だと保存できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end
    
    it 'emailが空だと保存できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end

    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
    end
    
    it 'emailに@が存在しない場合登録できないこと' do
      @user.email = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Eメールは不正な値です')
    end

    it 'birthdayが空だと保存できないこと' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("誕生日を入力してください")
    end

    it 'last_nameが空だと保存できないこと' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("名字を入力してください")
    end

    it 'last_nameが全角でないと保存できないこと' do
      @user.last_name = 'ﾊﾝｶｸ'
      @user.valid?
      expect(@user.errors.full_messages).to include('名字は全角で入力して下さい')
    end

    it 'first_nameが空だと保存できないこと' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("名前を入力してください")
    end

    it 'first_nameが全角でないと保存できないこと' do
      @user.first_name = 'ﾊﾝｶｸ'
      @user.valid?
      expect(@user.errors.full_messages).to include('名前は全角で入力して下さい')
    end

    it 'last_name_readingが空だと保存できないこと' do
      @user.last_name_reading = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("名字（カナ）を入力してください")
    end

    it 'last_name_readingが全角でないと保存できないこと' do
      @user.last_name_reading = 'ﾊﾝｶｸ'
      @user.valid?
      expect(@user.errors.full_messages).to include('名字（カナ）は全角カタカナで入力して下さい')
    end

    it 'first_name_readingが空だと保存できないこと' do
      @user.first_name_reading = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("名前（カナ）を入力してください")
    end

    it 'first_name_readingが全角でないと保存できないこと' do
      @user.first_name_reading = 'ﾊﾝｶｸ'
      @user.valid?
      expect(@user.errors.full_messages).to include('名前（カナ）は全角カタカナで入力して下さい')
    end

    it 'first_name_readingがカタカナでないと保存できないこと' do
      @user.first_name_reading = '陸太郎'
      @user.valid?
      expect(@user.errors.full_messages).to include('名前（カナ）は全角カタカナで入力して下さい')
    end
  end
end
