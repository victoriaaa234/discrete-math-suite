class CreateNewCategory < ActiveRecord::Migration[5.1]
	def change
		create_table "problem_categories", force: :cascade do |t|
			t.string "category_uid"
			t.string "category_name"
			t.datetime "created_at", null: false
			t.datetime "updated_at", null: false
			t.string "category_description"
			t.index ["category_uid"], name: "index_problem_categories_on_category_uid"
		end
	end
end
