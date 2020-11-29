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
    validates :last_name
    validates :first_name
    validates :last_name_reading
    validates :first_name_reading
  end

  with_options format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"} do
    validates :last_name
    validates :first_name
    validates :last_name_reading
    validates :first_name_reading
  end

end
