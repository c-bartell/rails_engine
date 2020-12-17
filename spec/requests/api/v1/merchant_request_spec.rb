require 'rails_helper'

RSpec.describe 'Merchant ReST endpoints' do
  it 'can return a list of all merchants' do
    create_list(:merchant, 20)

    get '/api/v1/merchants'

    expect(response).to be_successful

    merchant_response = JSON.parse(response.body, symbolize_names: true)

    expect(merchant_response).to have_key(:data)
    expect(merchant_response[:data]).to be_an(Array)
    expect(merchant_response[:data].count).to eq(20)

    merchants = merchant_response[:data]

    merchants.each do |merchant|
      expect(merchant).to have_key(:id)
      expect(merchant[:id]).to be_an(String)

      expect(merchant).to have_key(:type)
      expect(merchant[:type]).to eq('merchant')

      expect(merchant).to have_key(:attributes)
      expect(merchant[:attributes]).to be_an(Hash)

      expect(merchant[:attributes]).to have_key(:name)
      expect(merchant[:attributes][:name]).to be_an(String)
    end
  end
end
