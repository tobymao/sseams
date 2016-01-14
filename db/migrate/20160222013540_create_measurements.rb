class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
      t.references :user, index: true, null: false

      t.float :height, null: false, limit: 4
      t.float :weight, null: false, limit: 4
      t.float :neck, null: false, limit: 4
      t.float :butt, null: false, limit: 4
      t.float :arm, null: false, limit: 4
      t.float :chest, null: false, limit: 4
      t.float :back, null: false, limit: 4
      t.float :wrist, null: false, limit: 4
      t.float :waist, null: false, limit: 4
      t.float :shoulder, null: false, limit: 4

      t.string :front_image, null: false
      t.string :back_image, null: false
      t.string :side_image, null: false

      t.timestamps null: false
    end
  end
end
