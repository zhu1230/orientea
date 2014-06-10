require "spec_helper"

describe Orientea::CreatingCommand do
  include_context 'shared setup and clean'

  before(:each) do
    @customer = Customer.new
    @customer.attr_name = 'my name'
    @customer.attr_gender = 'male'
    @customer.attr_address = 'Nanjing'
  end
  it "action should work correctly with CreatingCommand" do
    expect{
      command = Orientea::CreatingCommand.build(@customer)
      command.save
      command.action
    }.to change{Customer.count}.from(0).to(1)
  end

  it "should save the command object" do
    expect{Orientea::CreatingCommand.build(@customer).save}.to change{Orientea::CreatingCommand.count}.by(1)
  end

  it "undo should work correctly" do
    command = Orientea::CreatingCommand.build(@customer)
    command.save
    command.action
    expect{command.undo}.to change{Customer.count}.from(1).to(0)
  end

end