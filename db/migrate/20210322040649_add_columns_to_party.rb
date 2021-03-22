class AddColumnsToParty < ActiveRecord::Migration[6.1]
  def change
    add_column :parties, :enrollment_date, :date
    add_column :parties, :address, :string
    add_column :parties, :phones, :string, array: true, default: []
    add_column :parties, :web, :string
    add_column :parties, :email, :string
    add_column :parties, :agents, :string, array: true, default: []
  end
end
