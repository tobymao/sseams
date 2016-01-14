class Views::Base < Fortitude::Widget
  doctype :html5

  def default_url_options(options={})
    if I18n.locale == I18n.default_locale
      options
    else
      { locale: I18n.locale }.merge(options)
    end
  end
end
