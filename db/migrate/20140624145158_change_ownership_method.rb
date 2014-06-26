class ChangeOwnershipMethod < ActiveRecord::Migration
  def change
    drop_table :ownerships
  end
end
