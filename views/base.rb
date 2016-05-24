module Views
  class Base < Fortitude::Widget
    extend Forwardable
    delegate [:csrf_tag, :current_path, :params] => :_delegate

    TABLET_W = '1000px'
    MOBILE_W = '600px'
    MAX_W    = '950px'

    doctype :html5

    def self.delegate= delegate
      @@delegate = delegate
    end

    def _delegate
      @@delegate
    end

    def self.inline hash
      array = hash.map do |k, v|
        "#{k.to_s.gsub '_', '-'}:#{v}"
      end

      array.join(';').freeze
    end

    def inline hash
      self.class.inline hash
    end
  end
end
