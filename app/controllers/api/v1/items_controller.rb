class Api::V1::ItemsController < ApplicationController
  def index
    render json: ItemSerializer.format_item(Item.all)
  end

  def show
    render json: ItemSerializer.format_item(Item.find(params[:id]))
  end

  def create
    render json: ItemSerializer.format_item(Item.create(item_params))
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :unit_price, :merchant_id)
  end
end
