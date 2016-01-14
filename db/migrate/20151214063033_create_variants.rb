class CreateVariants < ActiveRecord::Migration
  TABLE = :variants

  def change
    create_table TABLE do |t|
      t.references :item, index: true, null: false
      t.integer :kind, null: false, limit: 1
      t.string :value, null: false
      t.string :description

      t.timestamps null: false
    end
  end
end
