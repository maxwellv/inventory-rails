class CreateOwnerships < ActiveRecord::Migration
  def change
    create_table :ownerships do |t|
      t.integer "user_id"
      t.integer "jewelry_id"
      t.timestamps
    end
  end
end
