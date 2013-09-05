require './lib/toyrobot/robotcommands/Command'
require './lib/toyrobot/robotcommands/MoveEast'
require './lib/table/TableTop'
require './lib/table/TablePosition'
require './lib/toyrobot/Direction'
require './lib/toyrobot/Robot'

describe 'RobotCommands::MoveEast' do
  let(:robot) { Robot.new(Direction.new.face(:EAST), TablePosition.new(1,1)) }

  it 'Moves robot EAST' do
    RobotCommands::MoveEast.new(robot, TableTop.new).execute
    robot.position.x.should eq(2)
  end
end
