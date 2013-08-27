require 'spechelper'
require './toyrobot/robotcommands/Command'
require './toyrobot/robotcommands/Report'
require './table/TableTop'
require './table/TablePosition'
require './toyrobot/Direction'
require './toyrobot/Robot'

describe 'RobotCommands::TurnRight' do
  let(:robot) { Robot.new(Direction.new.face(:NORTH), TablePosition.new(1,1)) }

  it 'Turns robot to the right' do
    output = capture_stdout { RobotCommands::Report.new(robot).execute }
    output.should == "1,1,NORTH\n"
  end
end