class CreateGroups < ActiveRecord::Migration
  def up
    create_table :groups do |t|
      t.string :name
    end
    create_table :groups_users, :id => false do |t|
      t.references :group
      t.references :user
    end
    create_table :groups_roles, :id => false do |t|
      t.references :role
      t.references :group
    end
    add_index :groups_users, [:group_id, :user_id]
    add_index :groups_users, [:user_id, :group_id]
    add_index :groups_roles, [:group_id, :role_id]
    add_index :groups_roles, [:role_id, :group_id]
  end

  def down
    drop_table :groups_users
    drop_table :groups_roles
    drop_table :groups
  end
end
