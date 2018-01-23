class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum sex: { man: 1, woman: 2 }
  enum role: { ゲスト: 0, リクルーター: 1 }
  has_many :interviews
end
