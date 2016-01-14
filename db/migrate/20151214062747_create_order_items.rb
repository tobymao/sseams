class CreateOrderItems < ActiveRecord::Migration
  TABLE = :order_items

  def change
    create_table TABLE do |t|
      t.references :order, index: true, null: false
      t.references :item, index: true, null: false
      t.integer :price, null: false, default: 0
      t.string :feedback

      t.timestamps null: false
    end
  end
end
