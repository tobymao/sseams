class Views::Shared::ItemBox < Views::Base
  needs :item

  def content
    div class: 'item_box' do
      div class: 'left' do
        image_tag item.image_url
      end

      div class: 'right' do
        div class: 'name' do
          text item.name
        end

        div class: 'description' do
          text item.description
        end

        colors = item.variants.select(&:color?)

        div class: 'price' do
          text "#{colors.size} colors, $#{item.price}"
        end

        div class: 'colors' do
          colors.map do |color|
            div class: 'color', style: "background: #{color.value}"
          end
        end

        link_to t('shared.item_box.shop'), item_path(item), class: 'btn2'
      end
    end
  end
end
