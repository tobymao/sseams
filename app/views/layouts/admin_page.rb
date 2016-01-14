class Views::Layouts::AdminPage < Views::Base
  needs :current_user
  needs :current_path

  def content
    html do
      div class: 'navigation' do
        navigation
      end

      div class: 'error' do
        text flash[:error]
      end

      div class: 'notification' do
        text flash[:notification]
      end

      div class: 'main' do
        main
      end
    end
  end

  def navigation
    link_to t(:admin_nav_items), admin_items_path
    link_to t(:admin_nav_orders), admin_orders_path
  end

  def main
    p "This page intentionally left blank."
  end
end
