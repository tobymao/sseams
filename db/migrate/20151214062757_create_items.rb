class CreateItems < ActiveRecord::Migration
  TABLE = :items

  def up
    create_table TABLE do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.string :image
      t.integer :price, null: false, default: 0

      t.timestamps null: false
    end

    execute "CREATE UNIQUE INDEX index_items_on_name
                 ON items USING btree (lower(name));"
  end

  def down
    drop_table TABLE
  end
end
