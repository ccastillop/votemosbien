class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.string :sesion_id, index: true
      t.belongs_to :user, null: true, foreign_key: true
      t.belongs_to :option, null: false, foreign_key: true
      t.belongs_to :question, null: false, foreign_key: true
      t.integer :value_x
      t.integer :value_y

      t.timestamps
    end
  end
end
