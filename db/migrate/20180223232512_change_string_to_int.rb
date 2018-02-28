class ChangeStringToInt < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :num_correct, :integer
    add_column :users, :num_attempt, :integer
  end
end
