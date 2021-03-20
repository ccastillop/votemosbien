class CreateElections < ActiveRecord::Migration[6.1]
  def change
    create_table :elections do |t|
      t.string :name
      t.string :due_date

      t.timestamps
    end
  end
end
