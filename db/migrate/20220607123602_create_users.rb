class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, nil: false
      t.string :password_digest, nil: false
      t.integer :authority
      t.timestamps
    end
  end
end
