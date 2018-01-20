class PracticeProblems < ActiveRecord::Migration[5.1]
  def change
  	create_table :practice_problems do |p|
  		p.string :premise
  		p.string :problem
  		p.string :conclusion
  		p.timestamps
  	end
  end
end
