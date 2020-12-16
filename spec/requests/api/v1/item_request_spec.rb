require 'rails_helper'

RSpec.describe 'Items ReST Endpoints' do
  it 'sends a list of items' do
    create_list(:item, 20)

    get '/api/v1/items'

    expect(response).to be_successful

    index_response = JSON.parse(response.body, symbolize_names: true)

    expect(index_response).to have_key(:data)
    expect(index_response[:data]).to be_an(Array)

    items = index_response[:data]

    expect(items.count).to eq(20)

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

  it 'can get one item by its id' do
    id = create(:item).id

    get "/api/v1/items/#{id}"

    expect(response).to be_successful
    item_response = JSON.parse(response.body, symbolize_names: true)

    expect(item_response).to have_key(:data)
    expect(item_response[:data]).to be_an(Hash)

    item = item_response[:data]

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

  it 'can create a new item' do
    merchant = create(:merchant)
    item_params = {
      name: 'Kajigger',
      description: 'A whachacallit.',
      unit_price: 0.99,
      merchant_id: create(:merchant).id
    }
    headers = { 'CONTENT_TYPE' => 'application/json' }

    post '/api/v1/items', headers: headers, params: JSON.generate(item: item_params)

    created_item = Item.last

    expect(response).to be_successful
    expect(created_item.name).to eq(item_params[:name])
    expect(created_item.description).to eq(item_params[:description])
    expect(created_item.unit_price).to eq(item_params[:unit_price])
    expect(created_item.merchant_id).to eq(item_params[:merchant_id])
  end
end
