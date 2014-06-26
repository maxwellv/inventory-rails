class AddUserIdToJewelry < ActiveRecord::Migration
  def change
    change_table(:jewelries) do |t|
      t.integer :user_id
    end
  end
end
