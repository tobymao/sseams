require './views/base'

module Views
  class Banner < Base
    def content
      logo_style = inline(
        text_decoration: 'none',
        font_weight: '800',
        font_size: '2em',
        color: '#444444',
      )

      a '7seams', href: '/', style: logo_style

      login_style = inline(
        text_decoration: 'none',
        font_size: '1.5em',
        color: '#00a6ff',
        position: 'absolute',
        right: '0.2em',
      )

      a 'Login', href: '/signup', style: login_style
    end

  end
end
