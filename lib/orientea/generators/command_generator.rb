class CommandGenerator < Rails::Generators::NamedBase 
  source_root File.expand_path('../templates', __FILE__)  
  def create_migration
    migration_template 'create_command.rb', 'db/migrate/create_command_table.rb'
  end
end