class Invoice < ApplicationRecord
 has_many :invoice_items
 has_many :items, through: :invoice_items
 belongs_to :merchant

 validates_presence_of :status, :customer_id, :merchant_id
end
