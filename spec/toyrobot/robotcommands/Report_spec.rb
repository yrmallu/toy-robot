require 'spechelper'
require './lib/toyrobot/robotcommands/Command'
require './lib/toyrobot/robotcommands/Report'
require './lib/table/TableTop'
require './lib/table/TablePosition'
require './lib/toyrobot/Direction'
require './lib/toyrobot/Robot'

describe 'RobotCommands::TurnRight' do
  let(:robot) { Robot.new(Direction.new.face(:NORTH), TablePosition.new(1,1)) }

  it 'Turns robot to the right' do
    output = capture_stdout { RobotCommands::Report.new(robot).execute }
    output.should == "1,1,NORTH\n"
  end
end
