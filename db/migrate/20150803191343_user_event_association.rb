class UserEventAssociation < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.belongs_to :user
      t.belongs_to :event
    end
  end
end
