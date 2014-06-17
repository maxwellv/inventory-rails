class CreateJewelries < ActiveRecord::Migration
  def change
    create_table :jewelries do |t|
      t.integer "jewelry_type"
      t.float   "materials_cost"
      t.float   "hours_worked"
      t.timestamps
    end
  end
end
