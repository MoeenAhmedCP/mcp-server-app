class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :phone_number
      t.date :date_of_birth
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.string :postal_code
      t.string :role, default: 'user'
      t.string :status, default: 'active'
      t.datetime :last_login_at

      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :status
    add_index :users, :role
  end
end
