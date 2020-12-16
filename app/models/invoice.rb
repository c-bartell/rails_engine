class Invoice < ApplicationRecord
  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :transactions
  belongs_to :merchant
  belongs_to :customer

  validates :status, :customer_id, :merchant_id, presence: true
end
