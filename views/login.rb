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
        input type: 'submit', value: create ? 'Create Account' : 'Sign In'
      end

      if create
        label 'Already have an account?'
        a 'Login', href: '/login'
      else
        label 'Sign up for an account'
        a 'Sign up', href: '/signup'
      end
    end
  end
end
