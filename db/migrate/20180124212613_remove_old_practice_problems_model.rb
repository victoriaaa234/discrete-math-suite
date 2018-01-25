class RemoveOldPracticeProblemsModel < ActiveRecord::Migration[5.1]
  def up
    drop_table :practice_problems
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
