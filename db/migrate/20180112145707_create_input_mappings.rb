class CreateInputMappings < ActiveRecord::Migration[5.1]
  def change
    create_table :input_mappings do |t|
      t.string :outbound
      t.string :mapping

      t.timestamps
    end
  end
end
