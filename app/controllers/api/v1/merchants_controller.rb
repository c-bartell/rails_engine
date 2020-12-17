class Api::V1::MerchantsController < ApplicationController
  def index
    render json: MerchantSerializer.format_merchant(Merchant.all)
  end
end
