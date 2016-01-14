class Views::Admin::Orders::Index < Views::Layouts::AdminPage
  def main
    orders_tab
  end

  def orders_tab
    link_to t(:order_new), nil
    link_to t(:order_progress), nil
    link_to t(:order_completed), nil
  end
end
