class CreateAnswerLines < ActiveRecord::Migration[6.1]
  def change
    create_table :answer_lines do |t|
      t.belongs_to :answer, null: false, foreign_key: true
      t.belongs_to :option, null: false, foreign_key: true
      t.belongs_to :question, null: false, foreign_key: true
      t.integer :value_x
      t.integer :value_y

      t.timestamps
    end
  end
end
