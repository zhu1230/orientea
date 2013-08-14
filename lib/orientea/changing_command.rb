require 'orientea/command.rb'
module Orientea
  class ChangingCommand < Orientea::Command

    def self.build(record)
      command = self.new
      command.data = Hash.new
      command.data['cls_str'] = record.class.to_s
      command.data['cls_id'] = record.id
      command.data['changes'] = record.changes.to_json
      command.save!
      command
    end

    action do
      cls = self.data['cls_str'].constantize
      id = self.data['cls_id']
      object = cls.find(id)
      JSON.load(self.data['changes']).each do |key, value|
        object.send("#{key}=", value.last)
      end
      if object.save
        self.done = true
        self.save
      end
    end

    undo do
      cls = self.data['cls_str'].constantize
      id = self.data['cls_id']
      object = cls.find(id)
      JSON.load(self.data['changes']).each do |key, value|
        object.send("#{key}=", value.first)
      end
      if object.save
        self.done = false
        self.save
      end
    end

    # persist do
    #   self.data = @record.attributes
    #   self.data['changes'] = @record.class.to_s
    # end

  end
end