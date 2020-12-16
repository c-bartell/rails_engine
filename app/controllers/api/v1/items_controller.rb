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

  def update
    render json: ItemSerializer.format_item(Item.update(params[:id], item_params))
  end

  def destroy
    Item.destroy(params[:id])
  end

  private

  def item_params
    if params[:item]
      params.require(:item).permit(:name, :description, :unit_price, :merchant_id)
    else
      params.permit(:name, :description, :unit_price, :merchant_id)
    end
  end
end
