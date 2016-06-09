require './views/page'

module Views
  class Measurements < Page
    needs :measurement

    def render_main
      form action: '/measurements', method: 'post', enctype: 'multipart/form-data' do
        rawtext csrf_tag
        render_measurements
        render_uploads
        input type: 'submit', value: 'Next'
      end
    end

    def render_measurements
      input type: 'number', name: 'feet', placeholder: 'feet', value: feet
      input type: 'number', name: 'inches', placeholder: 'inches', value: inches
      input type: 'number', name: 'weight', placeholder: 'lbs', value: measurement&.weight
      input type: 'number', name: 'neck', placeholder: 'neck', value: measurement&.neck
      input type: 'number', name: 'back', placeholder: 'back', value: measurement&.back
      input type: 'number', name: 'chest', placeholder: 'chest', value: measurement&.chest
      input type: 'number', name: 'shoulder', placeholder: 'shoulder', value: measurement&.shoulder
      input type: 'number', name: 'waist', placeholder: 'waist', value: measurement&.waist
      input type: 'number', name: 'arm', placeholder: 'arm', value: measurement&.arm
      input type: 'number', name: 'butt', placeholder: 'butt', value: measurement&.butt
      input type: 'number', name: 'wrist', placeholder: 'wrist', value: measurement&.wrist
    end

    def render_uploads
      upload_box 'front'
      upload_box 'back'
      upload_box 'side'
    end

    def upload_box position
      input type: 'file', name: "#{position}_image", value: position
    end

    def feet
      (measurement&.height || 0).to_i / 12
    end

    def inches
      (measurement&.height || 0).to_i % 12
    end
  end
end
