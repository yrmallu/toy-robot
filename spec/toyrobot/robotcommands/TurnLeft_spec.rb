require './toyrobot/robotcommands/Command'
require './toyrobot/robotcommands/TurnLeft'
require './table/TableTop'
require './table/TablePosition'
require './toyrobot/Direction'
require './toyrobot/Robot'

describe 'RobotCommands::TurnLeft' do
  let(:robot) { Robot.new(Direction.new.face(:NORTH), TablePosition.new(1,1)) }

  it 'Turns robot to the left' do
    RobotCommands::TurnLeft.new(robot).execute
    robot.direction.currentdirection.should eq(:WEST)
  end
end