require './views/page'

module Views
  class Measurements < Page
    def render_main
      form action: '/measurements', method: 'post' do
        rawtext csrf_tag
        render_measurements
        render_uploads
        input type: 'submit', value: 'Next'
      end
    end

    def render_measurements
      input type: 'number', name: 'feet', placeholder: 'feet'
      input type: 'number', name: 'inches', placeholder: 'feet'
      input type: 'number', name: 'weight', placeholder: 'lbs'
      input type: 'number', name: 'neck', placeholder: 'Section 1'
      input type: 'number', name: 'back', placeholder: 'Section 2'
      input type: 'number', name: 'chest', placeholder: 'Section 3'
      input type: 'number', name: 'shoulder', placeholder: 'Section 4'
      input type: 'number', name: 'waist', placeholder: 'Section 5'
      input type: 'number', name: 'arm', placeholder: 'Section 6'
      input type: 'number', name: 'butt', placeholder: 'Section 7'
      input type: 'number', name: 'wrist', placeholder: 'Section 8'
    end

    def render_uploads
      upload_box 'front'
      upload_box 'back'
      upload_box 'side'
    end

    def upload_box position
      input type: 'file', name: position
    end
  end
end
