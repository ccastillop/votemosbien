class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, index: true, null: false
      t.string :password_digest
      t.string :recover_token
      t.string :level, default: "no_access"
      t.datetime :email_confirmed_at

      t.timestamps
    end
  end
end
