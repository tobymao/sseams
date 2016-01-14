class Views::Home::Index < Views::Layouts::Page
  needs :shirts

  def main
    div class: 'home' do
      intro
      how
      our_shirts
    end
  end

  def intro
    div class: 'intro' do
      div class: 'title' do
        text t '.intro_title'
      end

      div class: 'body' do
        text t '.intro_body'
      end

      div class: 'else' do
        text t '.intro_else'
      end

      div class: 'container' do
        link_to t('.intro_learn'), root_path, class: 'btn'
      end
    end
  end

  def how
    div class: 'how', id: 'how' do
      div class: 'title' do
        text t '.how_title'
      end

      div class: 'images' do
        box'/images/home/measure.svg', '.how_submit1', '.how_submit2'
        box'/images/home/photos.svg', '.how_upload1', '.how_upload2'
        box'/images/home/fabric.svg', '.how_pick1', '.how_pick2'
      end

      div class: 'container' do
        link_to t('.how_started'), measurements_path, class: 'btn'
      end
    end
  end

  def our_shirts
    div class: 'shirts', id: 'shirts' do
      div class: 'title' do
        text t '.shirts_title'
      end

      shirts.each do |shirt|
        widget Views::Shared::ItemBox, item: shirt
      end
    end
  end

  private
  def box(asset, t1, t2)
    div class: 'box' do
      image_tag asset, class: 'image'

      div class: 'top' do
        text t t1
      end

      div class: 'bottom' do
        text t t2
      end
    end
  end
end
