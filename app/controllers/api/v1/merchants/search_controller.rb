class Api::V1::Merchants::SearchController < ApplicationController
  def show
    result = Merchant.search(query)
    render json: MerchantSerializer.format_merchant(result) if result
  end

  private

  def query
    params.permit(:name, :created_at).to_h
  end
end
