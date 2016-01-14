class Views::Layouts::Application < Views::Base
  needs include_js: []
  needs js_block: ""

  def content
    html do
      head do
        title "Seven Seams"
        stylesheet_link_tag 'application', media: 'all'
        favicon_link_tag
        csrf_meta_tags
        #google_analytics
        include_js.map { |js| javascript_include_tag js }
        javascript js_block unless js_block.empty?
        javascript_include_tag 'application'
      end

      yield
    end
  end

  def google_analytics
    javascript <<-EOF
    EOF
  end
end
