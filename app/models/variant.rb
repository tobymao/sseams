class Variant < ActiveRecord::Base
  belongs_to :item, inverse_of: :variants

  KINDS = {
    color: 1,
  }

  def color?
    kind == KINDS[:color]
  end
end
