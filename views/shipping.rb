require './views/page'

module Views
  class Shipping < Page
    def render_main
      form action: '/shipping', method: 'post' do
        rawtext csrf_tag

        input type: 'text', name: 'name', placeholder: 'Name (First & Last)'
        input type: 'text', name: 'street', placeholder: 'Street'
        input type: 'text', name: 'city', placeholder: 'City'
        input type: 'text', name: 'state', placeholder: 'State'
        input type: 'text', name: 'zip', placeholder: 'Zip'

        a 'Back', href: '/shirts'
        input type: 'submit', value: 'Next'
      end
    end

  end
end
