class AddSellableToJewelry < ActiveRecord::Migration
  def change
    change_table(:jewelries) do |t|
      t.boolean :sellable
    end
  end
end
