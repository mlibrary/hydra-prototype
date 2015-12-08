class CreateCollectionConfigs < ActiveRecord::Migration
  def change
    create_table :collection_configs do |t|
      t.string  :resource, null: false
      t.boolean :can_embargo, default: true
      t.boolean :can_lease, default: true
      t.boolean :can_hide, default: false

      t.timestamps null: false
    end
    add_index :collection_configs, :resource, unique: true

  end
end
