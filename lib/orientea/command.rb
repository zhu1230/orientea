module Orientea
  class Command < ActiveRecord::Base
    self.table_name = :orientea_commands
    attr_accessible :done, :data

    def self.action(&block)
      define_method(:action, &block)
    end

    def self.undo(&block)
      define_method(:undo, &block)
    end
  end
end