class ItemsController < ApplicationController
  include Cart

  before_action :set_item

  # GET /items/1
  def show
  end

  # POST /items/1
  def add
    add_to_cart(@item)
    redirect_to item_path(@item)
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end
end
