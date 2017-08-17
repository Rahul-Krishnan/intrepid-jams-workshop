class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.integer :jersey_number, null: false
      t.references :team, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
