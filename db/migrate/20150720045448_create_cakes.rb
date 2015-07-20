class CreateCakes < ActiveRecord::Migration
  def change
    create_table :cakes do |t|
      t.string :name
      t.decimal :price, :precision => 8, :scale => 2
      t.text :description
      t.string :size

      t.timestamps null: false
    end
  end
end
