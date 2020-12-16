class ItemSerializer
  def self.format_item(items)
    {
      data: items.map do |item|
        {
        id: item.id,
        type: 'item',
        attributes: {
            merchant_id: item.merchant_id,
            name: item.name,
            description: item.description,
            unit_price: item.unit_price
          }
        }
      end
    }
  end
end
