require './lib/toyrobot/robotcommands/Command'
require './lib/toyrobot/robotcommands/MoveWest'
require './lib/table/TableTop'
require './lib/table/TablePosition'
require './lib/toyrobot/Direction'
require './lib/toyrobot/Robot'

describe 'RobotCommands::MoveWest' do
  let(:robot) { Robot.new(Direction.new.face(:WEST), TablePosition.new(1,1)) }

  it 'Moves robot WEST' do
    RobotCommands::MoveWest.new(robot, TableTop.new).execute
    robot.position.x.should eq(0)
  end
end
