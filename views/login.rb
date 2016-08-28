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
        input type: 'password', name: 'password', placeholder: 'Password'
        br
        br
        input type: 'submit', value: create ? 'Create Account' : 'Login'

        link_style = inline(margin_left: '1em')

        if create
          a 'Login', href: '/login', style: link_style
        else
          a 'Sign up', href: '/signup', style: link_style
        end
      end
    end
  end
end
