require 'rails_helper'

RSpec.describe 'Merchant relationship requests' do
  it 'can return all items associated with a merchant' do
    create(:merchant).items << create_list(:item, 5)
    id = Merchant.last.id

    get "/api/v1/merchants/#{id}/items"

    expect(response).to be_successful

    parsed_response = JSON.parse(response.body, sympolize_names: true)

    expect(parsed_response).to have_key(:data)
    expect(parsed_response[:data]).to be_an(Array)

    items = parsed_response[:data]

    expect(items.count).to eq(5)

    items.each do |item|
      expect(item).to have_key(:id)
      expect(item[:id]).to be_an(String)

      expect(item).to have_key(:type)
      expect(item[:type]).to be_an(String)

      expect(item).to have_key(:attributes)
      expect(item[:attributes]).to be_an(Hash)

      expect(item[:attributes]).to have_key(:merchant_id)
      expect(item[:attributes][:merchant_id]).to be_an(Integer)

      expect(item[:attributes]).to have_key(:name)
      expect(item[:attributes][:name]).to be_an(String)

      expect(item[:attributes]).to have_key(:description)
      expect(item[:attributes][:description]).to be_an(String)

      expect(item[:attributes]).to have_key(:unit_price)
      expect(item[:attributes][:unit_price]).to be_an(Float)
    end
  end
end
