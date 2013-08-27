require './toyrobot/robotcommands/Command'
require './toyrobot/robotcommands/TurnRight'
require './table/TableTop'
require './table/TablePosition'
require './toyrobot/Direction'
require './toyrobot/Robot'

describe 'RobotCommands::TurnRight' do
  let(:robot) { Robot.new(Direction.new.face(:NORTH), TablePosition.new(1,1)) }

  it 'Turns robot to the right' do
    RobotCommands::TurnRight.new(robot).execute
    robot.direction.currentdirection.should eq(:EAST)
  end
end