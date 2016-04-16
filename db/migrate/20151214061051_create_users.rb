class CreateUsers < ActiveRecord::Migration
  TABLE = :users

  def up
    create_table TABLE do |t|
      t.string  :email
      t.string  :password
      t.boolean :admin, null: false, default: false

      t.timestamps null: false
    end

    execute "CREATE UNIQUE INDEX index_users_on_email
                 ON users USING btree (lower(email));"
  end

  def down
    drop_table TABLE
  end
end
