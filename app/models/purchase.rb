class Purchase < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :buyer
  belongs_to_active_hash :prefecture

  validates :postal_number, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'ハイフンを含み且つ7桁の数字でで入力してください' }
  validates :postal_number, :city, :address, presence: true
  validates :prefecture_id, numericality: { other_than: 1 }
end
