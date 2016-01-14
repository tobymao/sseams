class Views::Layouts::Page < Views::Base
  needs :current_user
  needs :current_path

  def content
    html do
      div class: 'flash' do
        div(class: 'error') { text flash[:error] }
        div(class: 'notice') { text flash[:notice] }
      end

      div class: 'navigation' do
        navbar
      end

      widget Views::Login::Form, hidden: true

      div class: 'main' do
        main
      end
    end
  end

  def navbar
    div class: 'logo' do
      link_to '7Seams', root_path
    end

    div class: 'links' do
      link_to t('nav.how'), nil, onclick: "nav.scrollTo(event, 'how')", class: 'link'
      link_to t('nav.shirts'), nil, onclick: "nav.scrollTo(event, 'shirts')", class: 'link'

      if current_user
        link_to current_user.email
      else
        link_to t('nav.login'), login_path, onclick: 'nav.login(event)', class: 'link'
      end
    end
  end

  def main
    p "This page intentionally left blank."
  end
end
