class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'は"-"を含めて下さい' }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A[0-9０-９]+\z/, message: 'は数字のみで入力して下さい' }
  end

  validates :phone_number, length: { maximum: 12 }
  validates :prefecture_id, numericality: { other_than: 0, message: 'を選択して下さい' }

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
