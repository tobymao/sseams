class CreateAddons < ActiveRecord::Migration
  TABLE = :addons

  def change
    create_table TABLE do |t|
      t.references :item, index: true, null: false
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
