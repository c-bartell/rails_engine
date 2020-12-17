class MerchantSerializer
  def self.format_merchant(merchants)
    {
      data: merchants.map do |merchant|
        merchant_hash(merchant)
      end
    }
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
