require "spec_helper"

describe Orientea::ChangingCommand do
  include_context 'shared setup and clean'

  before(:each) do
    @customer = Customer.create(attr_name: 'vincent', attr_gender: 'male', attr_address: 'Nanjing')  
  end
  it "should work correctly with action" do
    @customer.attr_name = 'Derek'
    command = Orientea::ChangingCommand.build(@customer)
    expect(command.done).to be_false
    expect{
      command.action
    }.to change{Customer.first.attr_name}.from('vincent').to('Derek')
    expect(command.done).to be_true
  end

  it "should save the command object" do
    expect{Orientea::ChangingCommand.build(@customer)}.to change{Orientea::ChangingCommand.count}.by(1)
  end

  it "should work correctly with undo" do
    @customer.attr_name = 'Derek'
    command = Orientea::ChangingCommand.build(@customer)
    command.action
    expect{command.undo}.to change{Customer.first.attr_name}.from('Derek').to('vincent')
  end
end