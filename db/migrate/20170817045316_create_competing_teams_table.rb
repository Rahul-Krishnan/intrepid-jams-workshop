class CreateCompetingTeamsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :competing_teams do |t|
      t.references :game, index: true, foreign_key: true
      t.references :team, index: true, foreign_key: true
      t.integer :score, null: false

      t.timestamps null: false
    end
  end
end
