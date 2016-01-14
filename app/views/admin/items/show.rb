class Views::Admin::Items::Show < Views::Layouts::AdminPage
  needs :item

  def main
    form_for [:admin, item], multipart: true do |f|
      f.label :name, t('.name')
      f.text_field :name

      f.label :description, t('.description')
      f.text_field :description

      f.label :price, t('.price')
      f.text_field :price

      br

      image_tag item.image_url

      br

      f.label :image, t('.image')
      f.file_field :image

      br

      f.label :variants

      br

      item.variants.map do |variant|
        f.fields_for :variants, variant do |ff|
          ff.collection_select :kind, Variant::KINDS, :last, :first
          ff.text_field :value
          ff.text_field :description
        end

        br
      end

      br

      f.label :new_variant

      br

      f.fields_for :variants, Variant.new do |ff|
        ff.collection_select :kind, Variant::KINDS, :last, :first
        ff.text_field :value, placeholder: t('.value')
        ff.text_field :description, placeholder: t('.description')
      end

      br

      f.submit item.new_record? ? t('.create') : t('.update')
    end
  end
end
