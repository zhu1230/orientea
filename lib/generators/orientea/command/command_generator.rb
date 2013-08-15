 module Orientea
  class CommandGenerator < Rails::Generators::Base
    include Rails::Generators::Migration

    source_root File.expand_path('../templates', __FILE__)  
    # desc "rails g orientea:command"
    def create_migration
      migration_template 'create_command.rb', 'db/migrate/create_command_table.rb'
    end

    def self.next_migration_number(dir)
      ActiveRecord::Migration.next_migration_number(dir.to_i)
    end
  end
end