class Views::Layouts::Admin < Views::Base
  def content
    html do
      head do
        title "Seven Seams Admin"
        stylesheet_link_tag 'application', media: 'all'
        javascript_include_tag 'application'
        favicon_link_tag 'favicon.ico'
        csrf_meta_tags
      end

      yield
    end
  end
end
