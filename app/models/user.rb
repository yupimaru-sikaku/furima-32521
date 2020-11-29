class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
  validates :nickname, uniqueness: true
  validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "Include both letters and numbers"}
  with_options presence: true do
    validates :nickname
    validates :birthday, presence: true
    validates :last_name, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
    validates :first_name, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
    validates :last_name_reading, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
    validates :first_name_reading, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
  end
  
end


# with_options presence: true do
#   validates :name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
#   validates :name_reading, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."}
#   validates :nickname, format: { with: /\A[a-z0-9]+\z/i, message: "is invalid. Input half-width characters."}
#   validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
#   validates :price, format: {with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters."}
# end