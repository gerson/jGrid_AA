class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :description
      t.integer :product_id

      t.timestamps
    end
  end
end
