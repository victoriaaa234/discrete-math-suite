class ChangeStringToInt < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :num_correct, 'integer USING CAST(num_correct AS integer)'
    change_column :users, :num_attempt, 'integer USING CAST(num_attempt AS integer)'
  end
end
