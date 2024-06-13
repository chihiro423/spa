class CreateHotsprings < ActiveRecord::Migration[6.1]
  def change
    create_table :hotsprings do |t|
      t.string :name
      t.text :point
      t.string :spot
      t.integer :fee
      t.text :service

      t.timestamps
    end
  end
end
