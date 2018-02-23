class AddUserColumnNumCorrect < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :num_correct, :string
  end
end
