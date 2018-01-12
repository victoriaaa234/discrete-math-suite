class CreateLatexMappings < ActiveRecord::Migration[5.1]
  def change
    create_table :latex_mappings do |t|
      t.string :latex
      t.string :mapping

      t.timestamps
    end
  end
end
