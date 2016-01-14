class Item < ActiveRecord::Base
  has_many :variants, inverse_of: :item

  mount_uploader :image, ItemImageUploader

  validates :name, :description, presence: true

  after_save :remove_empty_variants

  accepts_nested_attributes_for :variants, allow_destroy: true

  private
  def remove_empty_variants
    variants.where(value: '', description:'').destroy_all
  end
end
