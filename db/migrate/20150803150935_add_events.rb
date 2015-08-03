class AddEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :game_name
      t.integer :num_players
      t.string :time
      t.string :location
      t.string :description
      t.references :user, index: true, foreign_key: true
    end
  end
end
