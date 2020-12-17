class InvoiceItem < ApplicationRecord
  belongs_to :item
  belongs_to :invoice

  validates :item_id, :invoice_id, :unit_price, :quantity, presence: true
  validates :quantity, :unit_price, numericality: { greater_than_or_equal_to: 0 }
end
