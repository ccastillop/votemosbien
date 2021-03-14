class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, index: true, null: false
      t.string :password_digest
      t.string :recover_token
      t.datetime :email_confirmed_at

      t.timestamps
    end
  end
end
