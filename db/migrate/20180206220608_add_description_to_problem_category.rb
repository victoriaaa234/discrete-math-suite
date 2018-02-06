class AddDescriptionToProblemCategory < ActiveRecord::Migration[5.1]
  def change
	  add_column :problem_categories, :category_description, :string
  end
end
