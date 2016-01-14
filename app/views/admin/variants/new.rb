class Views::Admin::Variants::New < Views::Layouts::AdminPage
  needs :item

  def main
    form_tag admin_items_path do
      fields_for item do |f|
        f.label :name, t(:admin_item_name)
        f.text_field :name

        f.label :description, t(:admin_item_description)
        f.text_field :description

        f.label :price, t(:admin_item_price)
        f.text_field :price

        f.submit t(:admin_item_create)
      end
    end
  end

end
