class AddUserColumnNumAttempt < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :num_attempt, :string
  end
end
