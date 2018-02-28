class ChangeStringToInt < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :num_correct, :integer
    change_column :users, :num_attempt, :integer
  end
end
