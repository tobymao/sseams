class CreatePaymentProfiles < ActiveRecord::Migration
  TABLE = :payment_profiles

  def change
    create_table TABLE do |t|
      t.references :user, index: true, null: false
      t.string :stripe_token
      t.string :cc_last

      t.timestamps null: false
    end
  end
end
