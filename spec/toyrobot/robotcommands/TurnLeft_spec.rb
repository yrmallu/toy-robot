require './lib/toyrobot/robotcommands/Command'
require './lib/toyrobot/robotcommands/TurnLeft'
require './lib/table/TableTop'
require './lib/table/TablePosition'
require './lib/toyrobot/Direction'
require './lib/toyrobot/Robot'

describe 'RobotCommands::TurnLeft' do
  let(:robot) { Robot.new(Direction.new.face(:NORTH), TablePosition.new(1,1)) }

  it 'Turns robot to the left' do
    RobotCommands::TurnLeft.new(robot).execute
    robot.direction.current_direction.should eq(:WEST)
  end
end
