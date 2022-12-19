class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :categories, dependent: :destroy
  has_many :transactions, dependent: :destroy

  validates :first_name, presence: true, length: { maximum: 250 }
  validates :last_name, presence: true, length: { maximum: 250 }

  
end
