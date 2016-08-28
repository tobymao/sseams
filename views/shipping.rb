require './views/page'

module Views
  class Shipping < Page
    def render_main
      form action: '/shipping', method: 'post' do
        rawtext csrf_tag

        input type: 'text', name: 'name', placeholder: 'Name (First & Last)'
        br
        input type: 'text', name: 'street', placeholder: 'Street'
        br
        input type: 'text', name: 'city', placeholder: 'City'
        br
        input type: 'text', name: 'state', placeholder: 'State'
        br
        input type: 'text', name: 'zip', placeholder: 'Zip'

        br
        br
        a 'Back', href: '/shirts'
        input type: 'submit', value: 'Next', style: inline(background: 'none', border: 'none', cursor: 'pointer')

      end
    end

  end
end
