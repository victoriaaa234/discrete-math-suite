class CreatePracticeProblems < ActiveRecord::Migration[5.1]
  def change
    create_table :practice_problems do |t|
      t.string :problem_uid
      t.string :premises
      t.string :conclusion
      t.string :category_uid

      t.timestamps
    end
    add_index :practice_problems, :problem_uid
    add_index :practice_problems, :category_uid
  end
end
