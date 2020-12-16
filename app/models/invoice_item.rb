class InvoiceItem < ApplicationRecord
  belongs_to :item
  belongs_to :invoice

  validates_presence_of :item_id, :invoice_id
  validates :quantity, :unit_price, numericality: { greater_than_or_equal_to: 0 }
end
