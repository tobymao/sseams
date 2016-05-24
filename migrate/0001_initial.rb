Sequel.migration do
  up do
    create_table :users do
      primary_key :id
      String :email, null: false
      String :name, null: false
      String :password, null: false

      DateTime :created_at, null: false
      DateTime :updated_at, null: false
    end

    run 'CREATE UNIQUE INDEX index_users_on_email
                 ON users USING btree (lower(email));'

    create_table :sessions do
      primary_key :id
      String :token, null: false, index: true, unique: true
      foreign_key :user_id, :users, null: false, index: true, on_delete: :cascade

      DateTime :created_at, null: false
      DateTime :updated_at, null: false
    end
  end

  down do
    drop_table :sessions
    drop_table :users
  end
end
