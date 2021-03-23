class AddUserColumnToCandidate < ActiveRecord::Migration[6.1]
  def change
    add_reference :candidates, :user, null: true, foreign_key: true
  end
end
