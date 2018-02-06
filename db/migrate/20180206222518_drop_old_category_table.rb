class DropOldCategoryTable < ActiveRecord::Migration[5.1]
	def up
		drop_table :problem_categories
	end

	def down
		fail ActiveRecord::IrreversibleMigration
	end
end
