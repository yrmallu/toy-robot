require './lib/toyrobot/robotcommands/Command'
require './lib/toyrobot/robotcommands/TurnRight'
require './lib/table/TableTop'
require './lib/table/TablePosition'
require './lib/toyrobot/Direction'
require './lib/toyrobot/Robot'

describe 'RobotCommands::TurnRight' do
  let(:robot) { Robot.new(Direction.new.face(:NORTH), TablePosition.new(1,1)) }

  it 'Turns robot to the right' do
    RobotCommands::TurnRight.new(robot).execute
    robot.direction.current_direction.should eq(:EAST)
  end
end
