class AddUserProfile < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.belongs_to :user, index: true
      t.string :location, :limit => 80
      t.string :gender, :limit => 10
      t.string :owned_games
      t.text   :bio, :limit => 1000
      t.text   :img_url
    end
  end
end
