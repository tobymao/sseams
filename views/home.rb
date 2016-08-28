require './views/page'

module Views
  class Home < Page
    def render_main
      render_steps
    end

    def render_steps
      link_style = inline(
        margin_top: '1em',
        display: 'block',
      )

      div style: inline(text_align: 'center') do
        h1  do
          text 'HOW IT WORKS'
        end

        box 'Submit Your Measurements', 'we tell you what to do'
        box 'Upload Your Pictures', 'so we get the nuances in your shirt'
        box 'Pick Your Fabric', 'look great for any occassion'

        br; br

        a 'Get Started', href: '/measurements', style: inline(margin_top: '1em')
      end
    end

    def box t1, t2
      div style: inline(display: 'inline-block', margin_right: '1em') do
        h2 do
          text t1
        end

        div style: inline(font_size: '0.8em') do
          text t2
        end
      end
    end
  end
end
