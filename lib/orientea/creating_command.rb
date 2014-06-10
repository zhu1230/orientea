require 'orientea/command.rb'
module Orientea
  class CreatingCommand < Orientea::Command

    validates :data, presence: true
    
    def self.build(record)
      command = self.new
      command.data = Hash.new
      command.data['changes'] = record.attributes.to_json
      command.data['cls_str'] = record.class.to_s
      command
    end

    def get_record
      cls = self.data['cls_str'].constantize
      self.done ? cls.find(self.data['cls_id']): cls.new(JSON.load(self.data['changes']), without_protection: true)
    end

    action do
      cls = self.data['cls_str'].constantize
      new_object = cls.new(JSON.load(self.data['changes']), without_protection: true)
      if new_object.save
        self.data['cls_id'] = new_object.id
        self.data_will_change!
        self.done = true
        self.save
      end
    end

    undo do
      cls = self.data['cls_str'].constantize
      cls.find(self.data['cls_id']).destroy
      self.done = false
      self.save
    end

  end
end