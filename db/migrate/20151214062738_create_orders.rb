class CreateOrders < ActiveRecord::Migration
  TABLE = :orders

  def change
    create_table TABLE do |t|
      t.references :user, index: true, null: false
      t.string :ip_address, null: false
      t.string :status, null: false
      t.string :transaction_id, index: true
      t.string :note
      t.integer :total, null: false, default: 0

      t.string :name, null: false
      t.string :address, null: false
      t.string :address_2
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip, null: false
      t.string :phone

      t.timestamps null: false
    end
  end
end
