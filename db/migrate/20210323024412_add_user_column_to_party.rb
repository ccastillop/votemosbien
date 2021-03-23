class AddUserColumnToParty < ActiveRecord::Migration[6.1]
  def change
    add_reference :parties, :user, null: true, foreign_key: true
  end
end
