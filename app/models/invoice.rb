class Invoice < ApplicationRecord
  has_many :invoice_items, dependent: :destroy
  has_many :items, through: :invoice_items
  has_many :transactions, dependent: :destroy
  belongs_to :merchant
  belongs_to :customer

  validates :status, :customer_id, :merchant_id, presence: true
end
