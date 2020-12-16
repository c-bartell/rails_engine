class Transaction < ApplicationRecord
  belongs_to :invoice

  validates_presence_of :credit_card_number, :credit_card_expiration_date, :result
  validates :credit_card_number, :credit_card_expiration_date, numericality: true
end
