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

    create_table :measurements do
      primary_key :id
      Real :height, null: false
      Real :weight, null: false
      Real :neck, null: false
      Real :back, null: false
      Real :chest, null: false
      Real :shoulder, null: false
      Real :waist, null: false
      Real :arm, null: false
      Real :butt, null: false
      Real :wrist, null: false
      String :front_image_data
      String :back_image_data
      String :side_image_data
      foreign_key :user_id, :users, null: false, index: true, on_delete: :cascade

      DateTime :created_at, null: false
      DateTime :updated_at, null: false
    end

    create_table :addresses do
      primary_key :id
      String :name, null: false
      String :street, null: false
      String :city, null: false
      String :state, null: false
      String :zip, null: false
      foreign_key :user_id, :users, null: false, index: true, on_delete: :cascade

      DateTime :created_at, null: false
      DateTime :updated_at, null: false
    end
  end

  down do
    drop_table :sessions
    drop_table :measurements
    drop_table :addresses
    drop_table :users
  end
end
