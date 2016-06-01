require './views/page'

module Views
  class Home < Page
    def render_main
      render_steps
    end

    def render_steps
      link_style = inline(
        display: 'block',
      )

      div style: inline(text_align: 'center') do
        box 'Submit Your Measurements', 'we tell you what to do'
        box 'Upload Your Pictures', 'so we get the nuances in your shirt'
        box 'Pick Your Fabric', 'and look great for any occassion'
        a 'Get Started', href: '/measurements', style: link_style
      end
    end

    def box t1, t2
      div style: inline(display: 'inline-block') do
        div style: inline(font_size: '20px') do
          text t1
        end

        div do
          text t2
        end
      end
    end
  end
end
