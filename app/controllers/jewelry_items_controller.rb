class JewelryItemsController < ApplicationController
  before_action :set_jewelry_item, only: %i[ show ]

  # GET /jewelry_items or /jewelry_items.json
  def index
    @jewelry_items = JewelryItem.all
  end

  # GET /jewelry_items/1 or /jewelry_items/1.json
  def show
    @jewelry_item = JewelryItem.find(params[:id])
  end
end
