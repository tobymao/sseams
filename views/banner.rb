require './views/base'

module Views
  class Banner < Base
    def content
      render_logo
      render_login
    end

    def render_logo
      logo_style = inline(
        text_decoration: 'none',
        font_weight: '800',
        font_size: '2em',
        color: 'black',
        border: 'none',
      )

      a '7seams', href: '/', style: logo_style
    end

    def render_login
      login_style = inline(
        text_decoration: 'none',
        font_size: '1.5em',
        float: 'right',
        margin_right: '0.5em',
        margin_top: '0.15em',
        color: 'black',
        border: 'none',
      )

      button_style = inline(
        font_size: '1.5em',
        background: 'none',
        border: 'none',
        cursor: 'pointer',
      )

      if current_user
        logout_style = inline(
          display: 'inline-block',
          float: 'right'
        )
        form action: '/logout', method: 'post', style: logout_style do
          rawtext csrf_tag
          input type: 'submit', value: 'Logout', style: button_style
        end

        a current_user.name, href: '/', style: login_style
      else
        a 'Login', href: '/login', style: login_style
        a 'Sign Up', href: '/signup', style: login_style
      end
    end
  end
end
