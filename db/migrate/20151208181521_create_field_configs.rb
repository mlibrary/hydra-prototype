class CreateFieldConfigs < ActiveRecord::Migration
  def change
    create_table :field_configs do |t|
      t.string :property, null: false
      t.string :label, null: false
      t.text :help_text
      t.boolean :hidden, default: false
      t.boolean :required, default: false
      t.boolean :multiple, default: false
      t.string :input_type
      t.text :options
      t.integer :position
      t.integer :collection_config_id, null: false

      t.timestamps null: false
    end
    add_index :field_configs, :collection_config_id

  end
end
