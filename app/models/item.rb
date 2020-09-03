class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :state
  belongs_to_active_hash :burden
  belongs_to_active_hash :area
  belongs_to_active_hash :shipping
  has_one_attached :image

  validates_format_of :name, with: /.{1,40}/, message: '商品名の記入はは40文字までです'
  validates_format_of :description, with: /.{1,1000}/, message: '商品説明の記入は1000文字までです'
  validates :price, inclusion: { in: 300..9_999_999, message: '販売価格は300円〜9,999,999円です' }
  validates :image, :name, :description, :price, presence: true
  validates :category_id, :state_id, :burden_id, :area_id, :shipping_id, numericality: { other_than: 1 }
end
