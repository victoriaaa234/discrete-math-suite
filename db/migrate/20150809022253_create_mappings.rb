class CreateMappings < ActiveRecord::Migration[5.0]
  def change
    create_table :mappings do |m|
      m.string :logic
      m.string :mapping
    end
  end
end

