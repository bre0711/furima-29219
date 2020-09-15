class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :buyer
  belongs_to_active_hash :category
  belongs_to_active_hash :state
  belongs_to_active_hash :burden
  belongs_to_active_hash :area
  belongs_to_active_hash :shipping
  has_many_attached :images

  validates_format_of :name, with: /.{1,40}/, message: 'の記入はは40文字までです'
  validates_format_of :description, with: /.{1,1000}/, message: 'の記入は1000文字までです'
  validates :price, inclusion: { in: 300..9_999_999, message: 'は300円〜9,999,999円です' }
  validates :images, :name, :description, :price, presence: true
  validates :category_id, :state_id, :burden_id, :area_id, :shipping_id, numericality: { other_than: 1 , message: 'を入力してください'}
end
