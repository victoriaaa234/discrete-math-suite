class AddUserColumnSection < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :section, :string
  end
end
