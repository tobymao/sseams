require './views/page'

module Views
  class Measurements < Page
    needs :measurement

    def render_main
      h1 'INPUT MEASUREMENTS'

      form action: '/measurements', method: 'post', enctype: 'multipart/form-data' do
        rawtext csrf_tag
        render_measurements
        render_uploads
        br; br
        input type: 'submit', value: 'Next'
      end
    end

    def render_measurements
      label 'Height'
      br; br
      input type: 'number', step: 0.5, name: 'feet', placeholder: 'feet', value: feet
      input type: 'number', step: 0.5, name: 'inches', placeholder: 'inches', value: inches
      br; br

      render_input 'weight', 'Weight', 'lbs', measurement&.weight
      render_input 'neck', 'Neck', 'neck', measurement&.neck
      br; br

      render_input 'back', 'Back', 'back', measurement&.back
      render_input 'chest', 'Chest', 'chest', measurement&.chest
      br; br

      render_input 'shoulder', 'Shoulder', 'shoulder', measurement&.shoulder
      render_input 'waist', 'Waist', 'waist', measurement&.waist
      br; br

      render_input 'arm', 'Arm', 'arm', measurement&.arm
      render_input 'butt', 'Butt', 'butt', measurement&.butt
      br; br

      render_input 'wrist', 'Wrist', 'wrist', measurement&.wrist
    end

    def render_uploads
      br; br
      h1 'UPLOAD PHOTOS'
      label 'Front'
      br; br
      upload_box 'front'
      br; br
      label 'Back'
      br; br
      upload_box 'back'
      br; br
      label 'Side'
      br; br
      upload_box 'side'
    end

    def render_input name, display, placeholder, value
      div style: inline(display: 'inline-block') do
        label display
        br; br
        input type: 'number', step: 0.5, name: name, placeholder: placeholder, value: value
      end
    end

    def upload_box position
      input type: 'file', name: "#{position}_image", value: position
    end

    def feet
      measurement.height.to_i / 12 if measurement
    end

    def inches
      measurement.height.to_i % 12 if measurement
    end
  end
end
