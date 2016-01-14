class OrdersController < ApplicationController
  include ApplicationHelper
  include Cart

  before_action :set_user

  # GET /orders/new
  def new
    include_stripe_js
    set_stripe_pk

    @order = Order.new(user: @user)
    @cart = cart
  end

  # PUT /orders
  def create
    puts "**creating #{params}"
    redirect_to new_order_path
  end

  private
  def set_user
    @user = current_user
  end

  def include_stripe_js
    @include_js = %w{https://js.stripe.com/v2/}
  end

  def set_stripe_pk
    @js_block = "Stripe.setPublishableKey('#{Rails.configuration.stripe[:publishable_key]}');"
  end
end
