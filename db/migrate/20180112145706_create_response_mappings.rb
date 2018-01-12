class CreateResponseMappings < ActiveRecord::Migration[5.1]
  def change
    create_table :response_mappings do |t|
      t.string :logic
      t.string :mapping

      t.timestamps
    end
  end
end
