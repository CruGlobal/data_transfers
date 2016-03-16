class DeviseCreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :username,              null: false, default: ""
      t.string :guid,              null: false

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string     :current_sign_in_ip
      t.string     :last_sign_in_ip

      t.timestamps null: false
    end

    add_index :users, :username,                unique: true
  end
end