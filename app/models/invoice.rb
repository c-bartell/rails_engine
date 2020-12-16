class Invoice < ApplicationRecord
 has_many :invoice_items
 has_many :items, through: :invoice_items
 has_many :transactions
 belongs_to :merchant
 belongs_to :customer

 validates_presence_of :status, :customer_id, :merchant_id
end
