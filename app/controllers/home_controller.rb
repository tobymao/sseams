class HomeController < ApplicationController
  # GET /
  def index
    @shirts = Item.includes(:variants).all
  end
end
