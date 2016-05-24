require './views/base'

module Views
  class Page < Base
    def content
      html do
        head do
          link rel: 'stylesheet', type: 'text/css', href: 'https://fonts.googleapis.com/css?family=Open+Sans:400,400italic,700'
          link rel: 'stylesheet', type: 'text/css', href: '/vendor/reset.min.css'
          link rel: 'shortcut icon', type: 'image/png', href: '/images/favicon.ico'
          render_head
          render_style
          meta name: 'viewport', content: 'width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0'
          meta name: 'apple-mobile-web-app-capable', content: 'yes'
        end

        div style: inline(min_height: '95%') do
          div class: 'container' do
            render_banner
          end

          div class: 'container' do
            render_main
          end
        end

        render_footer
      end
    end

    def render_head
      title 'Seven Seams'
    end

    def render_style
      style <<~CSS
        body {
          font-family: 'Open Sans';
          width: 100%;
        }

        h1 {
          font-size: 2em;
          margin-bottom: 0.3em;
          line-height: 1em;
        }

        h2 {
          font-weight: bold ;
          font-size: 0.8em;
          margin-bottom: 1em;
        }

        .container {
          position: relative;
          padding: 0 5% 0 5%;
          margin: 0 auto;
          text-align: justify;
          max-width: #{MAX_W};
        }
      CSS
    end
    static :render_style

    def render_banner
      widget Banner
    end

    def render_main
      text 'This page intentionally left blank.'
    end

    def render_footer
      footer_style = inline(
        bottom: '0',
        font_size: '80%',
        text_align: 'center',
      )

      div style: footer_style do
        rawtext '&copy; Seven Seams 2016.'

        ls = inline(margin: '0.5em', text_decoration: 'none')

        div do
          a 'About', href: '/about', style: ls
          a 'Contact', href: '/contact', style: ls
          a 'Podcasts', href: '/podcasts', style: ls
          a 'Videos', href: '/videos', style: ls
        end
      end
    end
  end
end
