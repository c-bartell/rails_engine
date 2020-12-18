require 'rails_helper'

RSpec.describe 'Merchant finder endpoints' do
  describe 'Single merchant finder' do
    it 'can find and return a single merchant when queried with a merchant name' do
      create_list :merchant, 9
      merchant_params = {
        name: 'The Arasaka Corporation'
      }
      target_merchant = Merchant.create(merchant_params)

      get "/api/v1/merchants/find?name=The%20Arasaka%20Corporation"

      expect(response).to be_successful

      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response).to have_key(:data)
      expect(parsed_response[:data]).to be_an(Hash)

      merchant = parsed_response[:data]

      expect(merchant).to have_key(:id)
      expect(merchant[:id]).to eq(target_merchant.id.to_s)

      expect(merchant).to have_key(:type)
      expect(merchant[:type]).to eq('merchant')

      expect(merchant).to have_key(:attributes)
      expect(merchant[:attributes]).to be_an(Hash)

      expect(merchant[:attributes]).to have_key(:name)
      expect(merchant[:attributes][:name]).to eq(target_merchant.name)
    end

    it 'works when queried with a case insensitive fragment' do
      create_list :merchant, 9
      merchant_params = {
        name: 'The Arasaka Corporation'
      }
      target_merchant = Merchant.create(merchant_params)

      get "/api/v1/merchants/find?name=ASAKa%20coRP"

      expect(response).to be_successful

      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response).to have_key(:data)
      expect(parsed_response[:data]).to be_an(Hash)

      merchant = parsed_response[:data]

      expect(merchant).to have_key(:id)
      expect(merchant[:id]).to eq(target_merchant.id.to_s)
    end
  end
end
# This endpoint should return a single record that matches a set of criteria. Criteria will be input through query parameters.

# The URI should follow this pattern: GET /api/v1/merchants/find?<attribute>=<value>
#
# This endpoint should:
# * Work for any attribute of the corresponding resource including the updated_at and created_at timestamps.
# * Find partial matches for strings and be case insensitive, for example a request to GET /api/v1/merchants/find?name=ring would match a merchant with the name Turing and a merchant with the name Ring World.
#
# Note: It does NOT need to accept multiple attributes, for example GET /api/v1/items/find?name=pen&description=blue
