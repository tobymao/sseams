module Cart
  extend ActiveSupport::Concern

  private
  def add_to_cart(item, quantity=1)
    item_id = item.id.to_s
    if cart[item_id]
      cart[item_id] += quantity
    else
      cart[item_id] = quantity
    end
  end

  def cart
    session[:cart] ||= {}
  end
end
