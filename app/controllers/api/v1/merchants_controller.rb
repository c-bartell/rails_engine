class Api::V1::MerchantsController < ApplicationController
  def index
    render json: MerchantSerializer.format_merchant(Merchant.all)
  end

  def show
    render json: MerchantSerializer.format_merchant(Merchant.find(params[:id]))
  end

  def create
    render json: MerchantSerializer.format_merchant(Merchant.create(merchant_params))
  end

  def update
    render json: MerchantSerializer.format_merchant(Merchant.update(params[:id], merchant_params))
  end

  def destroy
    Merchant.destroy(params[:id])
  end

  private

  def merchant_params
    params.permit(:name)
  end
end
