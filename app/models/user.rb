class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :items
  has_many :buyers
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  validates :nickname, :birthday, presence: true
  validates_format_of :password, with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z{6,}/i, message: '英数字が混合した６文字以上のパスワードにしてください'

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
    validates :first_name
    validates :last_name
  end
  with_options presence: true, format: { with: /\p{Katakana}/, message: '全角カタカナで入力してください' } do
    validates :first_kana_name
    validates :last_kana_name
  end
end
