class Item < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :select_delivery_fee
  belongs_to_active_hash :term

  with_options presence: true do
    validates :images
    validates :name
    validates :description
    validates :price, numericality: { only_integer: true, message: 'Half-width number' }
  end
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }

  with_options numericality: { other_than: 0, message: 'Select' } do
    validates :category_id
    validates :condition_id
    validates :select_delivery_fee_id
    validates :prefecture_id
    validates :term_id
  end
end
