class Views::Login::Form < Views::Base
  needs hidden: false
  needs create: false

  def content
    html do
      classes = ['login']
      classes << ' hidden' if hidden

      div class: classes, id: 'login' do
        login_form
      end
    end
  end

  def login_form
    path, klass, btn_text =
      if create
        [users_path, 'user', t('login.create')]
      else
        [login_path, 'form', t('login.login')]
      end

    form_tag path, class: 'form' do
      fields_for klass do |f|
        div do
          f.text_field :email, placeholder: t('login.email'), class: 'box'
        end

        div do
          f.password_field :password, placeholder: t('login.password'), class: 'box'
        end

        div do
          f.submit btn_text, class: 'btn2'
        end
      end

      div do
        link_to t('login.new'), new_user_path, class: 'link'
      end unless create

      div do
        link_to t('login.forgot'), login_reset_path, class: 'link'
      end
    end
  end
end
