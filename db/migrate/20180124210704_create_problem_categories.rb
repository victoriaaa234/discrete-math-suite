class CreateProblemCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :problem_categories do |t|
      t.string :category_uid
      t.string :category_name

      t.timestamps
    end
    add_index :problem_categories, :category_uid
  end
end
