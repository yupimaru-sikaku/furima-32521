class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy


  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'は文字と数字の両方を含めて下さい' }

  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :last_name
    validates :first_name
    validates :last_name_reading
    validates :first_name_reading
  end

  with_options format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力して下さい' } do
    validates :last_name
    validates :first_name
  end

  with_options format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナで入力して下さい' } do
    validates :last_name_reading
    validates :first_name_reading
  end

end
