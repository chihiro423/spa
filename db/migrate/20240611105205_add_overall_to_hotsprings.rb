class AddOverallToHotsprings < ActiveRecord::Migration[6.1]
  def change
    add_column :hotsprings, :overall, :integer
  end
end
