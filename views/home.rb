require './views/page'

module Views
  class Home < Page
    def render_main
      render_steps
    end

    def render_steps
      div style: inline(text_align: 'center') do
        box'/images/measure.svg', 'Submit Your Measurements', 'we tell you what to do'
        box'/images/photos.svg', 'Upload Your Pictures', 'so we get the nuances in your shirt'
        box'/images/fabric.svg', 'Pick Your Fabric', 'and look great for any occassion'
      end
    end

    def box(path, t1, t2)
      div style: inline(display: 'inline-block') do
        img src: path

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
