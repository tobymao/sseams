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
          div style: inline(margin_bottom: '3em'), class: 'container' do
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
          font-size: 2.5em;
          font-weight: bold;
          margin-bottom: 0.3em;
          line-height: 1em;
        }

        h2 {
          font-weight: bold;
          font-size: 1.3em;
          margin-bottom: 1em;
        }

        .container {
          position: relative;
          padding: 0 5% 0 5%;
          margin: 0 auto;
          text-align: justify;
          max-width: #{MAX_W};
        }

        a {
          color: black;
          border:1px solid black;
          text-decoration: none;
        }

        input[type=submit] {
          background: none;
          border:1px solid black;
          cursor: pointer;
          font-size: 1em;
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
      end
    end
  end
end
