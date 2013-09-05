require './lib/toyrobot/robotcommands/Command'
require './lib/toyrobot/robotcommands/MoveNorth'
require './lib/table/TableTop'
require './lib/table/TablePosition'
require './lib/toyrobot/Direction'
require './lib/toyrobot/Robot'

describe 'RobotCommands::MoveNorth' do
  let(:robot) { Robot.new(Direction.new.face(:NORTH), TablePosition.new(1,1)) }

  it 'Moves robot NORTH' do
    RobotCommands::MoveNorth.new(robot, TableTop.new).execute
    robot.position.y.should eq(2)
  end
end
