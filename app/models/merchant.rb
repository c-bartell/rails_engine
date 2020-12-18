class Merchant < ApplicationRecord
  has_many :items, dependent: :destroy
  has_many :invoices, dependent: :destroy

  validates :name, presence: true

  def self.search(query_params)
    return if query_params.count != 1

    attribute = query_params.to_a[0][0]
    query = query_params.to_a[0][1]
    if date?(attribute)
      # date = DateTime.parse(query)
      # where("DateTime(#{attribute}) = ?", query)
    else
      find_by("lower(#{attribute}) like ?", "%#{query.downcase}%")
    end
  end

  def self.date?(attribute)
    attribute == "created_at" || attribute == "updated_at"
  end
end
