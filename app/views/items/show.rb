class Views::Items::Show < Views::Layouts::Page
  needs :item
  def main
    div class: 'items' do
      div class: 'container' do
        div class: 'left' do
          div item.name
          div item.price
          div item.description
          button_to t('.add'), add_item_path(item), class: 'btn'
        end

        div class: 'right' do
          image_tag item.image_url
        end
      end
    end
  end
end
