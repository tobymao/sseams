class CartController < ApplicationController
  include Cart

  # GET /cart
  def index
    @cart = cart
  end
end
