class Views::Orders::New < Views::Layouts::Page
  needs :user
  needs :order

  def main
    form_tag '/orders', id: 'order_form' do
      label :name
      text_field_tag :name

      label :address
      text_field_tag :address

      label :address_2
      text_field_tag :address_2

      label :city
      text_field_tag :city

      label :state
      text_field_tag :state

      label :zip
      text_field_tag :zip

      label :phone
      text_field_tag :phone

      label :number
      text_field_tag 'number'

      label :month
      text_field_tag 'month'

      label :year
      text_field_tag 'year'

      label :cvv
      text_field_tag 'cvv'


      submit_tag 'submit', onclick: 'return orders.submit()'
    end
  end
end
