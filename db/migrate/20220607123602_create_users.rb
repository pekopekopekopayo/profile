class CreateUsers < ActiveRecord::Migration[5.2]
def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :authority
      t.boolean :active, null: false, default: true
      t.timestamps
    end
  end
end
