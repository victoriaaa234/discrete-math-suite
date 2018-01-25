class CreateProfileProblemJunctions < ActiveRecord::Migration[5.1]
  def change
    create_table :profile_problem_junctions do |t|
      t.string :profile_uid
      t.string :problem_uid

      t.timestamps
    end
    add_index :profile_problem_junctions, :profile_uid
  end
end
