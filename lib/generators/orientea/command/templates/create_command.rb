class CreateCommandTable < ActiveRecord::Migration
  def up
    execute "CREATE EXTENSION IF NOT EXISTS hstore"
    create_table :orientea_commands do |t|
      t.hstore :data
      t.boolean :done
      t.string :type
    end
  end

  def down
    drop_table :orientea_commands
  end
end