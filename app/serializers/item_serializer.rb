class ItemSerializer
  def self.format_item(items)
    {
      data: self.formatted_data(items)
    }
  end

  private

  def self.formatted_data(item_data)
    if item_data.is_a? Item
      self.item_hash(item_data)
    else
      item_data.map do |item|
        self.item_hash(item)
      end
    end
  end

  def self.item_hash(item)
    {
      id: item.id.to_s,
      type: 'item',
      attributes: self.attributes_hash(item)
    }
  end

  def self.attributes_hash(item)
    {
      merchant_id: item.merchant_id,
      name: item.name,
      description: item.description,
      unit_price: item.unit_price
    }
  end
end
