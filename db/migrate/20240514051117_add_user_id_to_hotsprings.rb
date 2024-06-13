class AddUserIdToHotsprings < ActiveRecord::Migration[6.1]
  def change
    add_column :hotsprings, :user_id, :integer
  end
end
