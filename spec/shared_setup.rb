shared_context 'shared setup and clean' do
   before(:each) do
    ActiveRecord::Base.establish_connection(
      adapter: 'postgresql',
      host: 'localhost',
      port: 5432,
      encoding: 'unicode',
      username: 'postgres',
      password: ''
    )
    ActiveRecord::Migration.class_eval do
      execute "CREATE EXTENSION IF NOT EXISTS hstore"
      unless ActiveRecord::Base.connection.table_exists?(:customers)
         create_table :customers do |t|
            t.string :attr_name
            t.string :attr_address
            t.string :attr_gender
         end
      end
      unless ActiveRecord::Base.connection.table_exists?(:orientea_commands)
         create_table :orientea_commands do |t|
           t.hstore :data
           t.boolean :done
           t.string :type
         end
      end
    end

    Customer = Class.new(ActiveRecord::Base) unless defined? Customer
  end

  after(:each) do
    ActiveRecord::Migration.class_eval do
      drop_table :customers
      drop_table :orientea_commands
    end
  end
end