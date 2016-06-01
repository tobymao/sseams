require './views/page'

module Views
  class Login < Page
    needs create: nil

    def render_main
      render_new
    end

    def render_new
      path = create ? '/user' : '/login'

      form action: path, method: 'post' do
        rawtext csrf_tag

        if create
          input type: 'text', name: 'name', placeholder: 'Name'
          br
        end

        input type: 'text', name: 'email', placeholder: 'Email'
        br
        input type: 'password', name: 'password'
        br
        input type: 'submit', value: create ? 'Create Account' : 'Sign In'
      end
    end
  end
end
