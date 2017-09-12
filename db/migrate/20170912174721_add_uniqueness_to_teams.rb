class AddUniquenessToTeams < ActiveRecord::Migration[5.0]
  def change
    add_index :teams, :name, unique: true
  end
end
