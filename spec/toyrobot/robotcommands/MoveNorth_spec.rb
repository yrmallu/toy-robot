require './toyrobot/robotcommands/Command'
require './toyrobot/robotcommands/MoveNorth'
require './table/TableTop'
require './table/TablePosition'
require './toyrobot/Direction'
require './toyrobot/Robot'

describe 'RobotCommands::MoveNorth' do
  let(:robot) { Robot.new(Direction.new.face(:NORTH), TablePosition.new(1,1)) }

  it 'Moves robot NORTH' do
    RobotCommands::MoveNorth.new(robot, TableTop.new).execute
    robot.position.y.should eq(2)
  end
end