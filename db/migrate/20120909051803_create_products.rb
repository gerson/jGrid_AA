class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :supplier
      t.integer :quantity
      t.date :next_deliver

      t.timestamps
    end
  end
end
