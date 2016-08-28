require './views/page'

module Views
  class Shirts < Page
    TYPES = [
      ["A", 6],
      ["B", 15],
      ["E", 13],
    ]

    def render_main
      form action: '/shirts', method: 'post' do
        rawtext csrf_tag
        render_shirts
        br
        a 'Back', href: '/measurements'
        input type: 'submit', value: 'Next', style: inline(margin_left: '1em')
      end
    end

    def render_shirts
      TYPES.each do |type|
        type[1].times do |i|
          label do
            name = "#{i}#{type[0]}"
            text name

            select name: name, style: inline(margin_left: '3em') do
              (0..5).each do |num|
                hash = { value: num }
                hash[:selected] = true if num == 0
                option hash do
                  text num
                end
              end
            end
            br

          end
        end
      end
    end

  end
end
