class Views::Admin::Items::Index < Views::Layouts::AdminPage
  needs :items

  def main
    link_to t(:admin_item_new), new_admin_item_path

    all_items
  end

  def all_items
    items.each do |item|
      div do
        link_to item.name, admin_item_path(item)
      end
    end
  end
end
