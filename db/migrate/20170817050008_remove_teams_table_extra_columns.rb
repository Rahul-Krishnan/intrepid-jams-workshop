class RemoveTeamsTableExtraColumns < ActiveRecord::Migration[5.0]
  def change
    remove_column(:teams, :score, :integer)
    remove_reference(:teams, :game, index: true, foreign_key: true)
  end
end
