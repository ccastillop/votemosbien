class CreateOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :options do |t|
      t.belongs_to :question, null: false, foreign_key: true
      t.string :name
      t.string :description
      t.integer :value_x
      t.integer :value_y

      t.timestamps
    end
  end
end
