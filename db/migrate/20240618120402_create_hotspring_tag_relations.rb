class CreateHotspringTagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :hotspring_tag_relations do |t|
      t.references :hotspring, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
