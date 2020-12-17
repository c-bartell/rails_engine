class MerchantSerializer
  def self.format_merchant(merchants)
    {
      data: # merchants.map do |merchant|
      #   merchant_hash(merchant)
      # end
      formatted_data(merchants)
    }
  end

  def self.formatted_data(merchant_data)
    if merchant_data.is_a? Merchant
      merchant_hash(merchant_data)
    else
      merchant_data.map do |merchant|
        merchant_hash(merchant)
      end
    end
  end

  def self.merchant_hash(merchant)
    {
      id: merchant.id.to_s,
      type: 'merchant',
      attributes: {
        name: merchant.name
      }
    }
  end
end
