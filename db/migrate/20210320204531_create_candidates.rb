class CreateCandidates < ActiveRecord::Migration[6.1]
  def change
    create_table :candidates do |t|
      t.string :dni
      t.string :names
      t.string :father_surname
      t.string :mother_surname
      t.string :number
      t.belongs_to :region, null: true, foreign_key: true
      t.belongs_to :party, null: false, foreign_key: true
      t.string :status
      t.belongs_to :election, null: false, foreign_key: true

      t.timestamps
    end
  end
end
