require './views/page'

module Views
  class Complete < Page
    def render_main
      form action: '/shipping', method: 'post' do
        rawtext csrf_tag

        div 'THANK YOU'
        div 'You will receive an invoice sent to your e-mail address'

        a 'Back', href: '/shirts'
      end
    end

  end
end
