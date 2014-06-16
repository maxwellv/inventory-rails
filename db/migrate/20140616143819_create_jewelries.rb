class CreateJewelries < ActiveRecord::Migration
  def change
    create_table :jewelries do |t|

      t.timestamps
    end
  end
end
