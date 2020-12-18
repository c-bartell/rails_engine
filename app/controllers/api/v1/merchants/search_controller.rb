class Api::V1::Merchants::SearchController < ApplicationController
  def show
    render json: MerchantSerializer.format_merchant(Merchant.search(query))
  end

  private

  def query
    params.permit(:name).to_h
  end
end
