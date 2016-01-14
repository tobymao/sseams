class Views::Cart::Index < Views::Layouts::Page
  needs :cart

  def main
    div t('.title')

    items = Item.where(id: cart.keys)

    items.map do |item|
      div do
        div item.name
        div cart[item.id.to_s]
        div item.price
      end
    end
  end
end
