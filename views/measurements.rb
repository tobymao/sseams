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
      input type: 'number', step: 0.5, name: 'feet', placeholder: 'feet', value: feet
      input type: 'number', step: 0.5, name: 'inches', placeholder: 'inches', value: inches
      input type: 'number', step: 0.5, name: 'weight', placeholder: 'lbs', value: measurement&.weight
      input type: 'number', step: 0.5, name: 'neck', placeholder: 'neck', value: measurement&.neck
      input type: 'number', step: 0.5, name: 'back', placeholder: 'back', value: measurement&.back
      input type: 'number', step: 0.5, name: 'chest', placeholder: 'chest', value: measurement&.chest
      input type: 'number', step: 0.5, name: 'shoulder', placeholder: 'shoulder', value: measurement&.shoulder
      input type: 'number', step: 0.5, name: 'waist', placeholder: 'waist', value: measurement&.waist
      input type: 'number', step: 0.5, name: 'arm', placeholder: 'arm', value: measurement&.arm
      input type: 'number', step: 0.5, name: 'butt', placeholder: 'butt', value: measurement&.butt
      input type: 'number', step: 0.5, name: 'wrist', placeholder: 'wrist', value: measurement&.wrist
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
