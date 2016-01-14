class Views::Measurements::Index < Views::Layouts::Page
  needs :current_user
  needs :measurement

  BODY_PARTS = [:neck, :butt, :arm, :chest, :back, :wrist, :waist, :shoulder]

  def main
    div class: 'measurements' do
      title

      form_for measurement, multipart: true do |f|
        container(f)
        f.hidden_field :user_id
        f.submit t('.update'), class: 'btn'
      end
    end
  end

  def title
    div class: 'title' do
      if current_user
        text t '.title_edit'
      else
        text t '.title_new'
      end
    end
  end

  def container(f)
    div class: 'container' do
      div class: 'left' do
        profile(f)
        measurements(f)
      end

      div class: 'right' do
        photos(f)
      end
    end
  end

  def profile(f)
    div class: 'profile' do
      div class: 'section_title' do
        text t '.profile'
      end

      div class: 'height' do
        text t '.height'
        height_selector(f)
      end

      div class: 'weight' do
        text t '.weight'
        f.number_field :weight, value: measurement.weight.to_i
      end
    end
  end

  def height_selector(f)
    height = measurement.height
    height_func = 'measurements.updateHeight()'

    select id: 'feet', onChange: height_func do
      (3..7).map do |feet|
        if feet == (height / 12).floor
          option feet, selected: 'selected'
        else
          option feet
        end
      end
    end

    select id: 'inches', onChange: height_func do
      (0..11).map do |inches|
        if inches == height % 12
          option inches, selected: 'selected'
        else
          option inches
        end
      end
    end

    f.hidden_field :height, id: 'height', value: height
  end

  def measurements(f)
    div class: 'measurements' do
      div class: 'section_title' do
        text t '.measurements'
      end

      div class: 'how' do
        text t '.measurements_how'
      end

      div do
        image_tag '/images/measurement/guide.svg', class: 'image'

        BODY_PARTS.map do |part|
          measurement_for_part(f, part)
        end
      end
    end
  end

  def measurement_for_part(f, part)
    div class: 'part' do
      f.label t ".#{part}"
      f.number_field part, step: 0.5
    end
  end

  def photos(f)
    div class: 'photos' do
      div class: 'section_title' do
        text t '.photos'
      end

      div do
        image_tag '/images/measurement/front.svg', class: 'image'
        image_tag '/images/measurement/back.svg', class: 'image'
        image_tag '/images/measurement/side.svg', class: 'image'
      end

      div class: 'how' do
        text t '.photos_how'
        br; br
        text t '.photos_door'
      end

      upload(f, :front)
      upload(f, :back)
      upload(f, :side)
    end
  end

  def upload(f, position)
    div class: 'upload' do
      div class: 'position' do
        text t(".#{position}")
      end

      div class: 'btn2' do
        span t('.select'), class: 'label'
        f.file_field "#{position}_image", onChange: 'measurements.updateFile(this)'
      end
      label t('.none'), id: "#{position}_label"
    end
  end
end
