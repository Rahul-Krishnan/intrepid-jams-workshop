class RemovePlayerNamesFromTeams < ActiveRecord::Migration[5.0]
  def change
    remove_column(:teams, :player_names, :string)
  end
end
