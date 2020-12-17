require 'rails_helper'

RSpec.describe 'Item relationship requests' do
  it 'can return the merchant associated with an item' do
    item = create :item
    item_merchant = item.merchant

    get "/api/v1/items/#{item.id}/merchants"

    expect(response).to be_successful

    parsed_response = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_response).to have_key(:data)
    expect(parsed_response[:data]).to be_an(Hash)

    merchant = parsed_response[:data]

    expect(merchant).to have_key(:id)
    expect(merchant[:id]).to be_an(String)
    expect(merchant[:id]).to eq(item_merchant.id.to_s)

    expect(merchant).to have_key(:type)
    expect(merchant[:type]).to be_an(String)
    expect(merchant[:type]).to eq('merchant')

    expect(merchant).to have_key(:attributes)
    expect(merchant[:attributes]).to be_an(Hash)

    expect(merchant[:attributes]).to have_key(:name)
    expect(merchant[:attributes][:name]).to be_an(String)
  end
end
