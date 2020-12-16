class Api::V1::ItemsController < ApplicationController
  def index
    render json: ItemSerializer.format_item(Item.all)
  end
end
