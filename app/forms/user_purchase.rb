class UserPurchase
  include ActiveModel::Model
  attr_accessor :postal_number, :city, :address, :building, :phone_number, :prefecture_id, :item_id, :user_id, :token

  validates :postal_number, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'はハイフン有りの7桁の数字でで入力してください' }
  validates :phone_number, format: { with: /\A\d{1,11}\z/, message: 'はハイフン無しの11桁以内で入力してください' }
  validates :postal_number, :city, :address, :phone_number, :token, presence: true
  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    buyer = Buyer.create(item_id: item_id, user_id: user_id)
    Purchase.create(postal_number: postal_number, city: city, address: address, building: building, phone_number: phone_number, prefecture_id: prefecture_id, buyer_id: buyer.id)
  end
end
