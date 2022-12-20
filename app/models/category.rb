class Category < ApplicationRecord
  belongs_to :user
  has_many :purchases

  has_one_attached :image
  validates :name, presence: true, length: { maximum: 250 }

  def total_purchases
    total = 0
    purchases.each do |purchases|
      total += purchases.amount
    end
    total
  end
end
