class CreateOrienteaCommand < ActiveRecord::Migration
  create_table :orientea_commands do |t|
   t.hstore :data
   t.boolean :done
   t.string :type
  end
end