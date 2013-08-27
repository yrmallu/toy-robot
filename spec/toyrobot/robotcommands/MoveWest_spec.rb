require './toyrobot/robotcommands/Command'
require './toyrobot/robotcommands/MoveWest'
require './table/TableTop'
require './table/TablePosition'
require './toyrobot/Direction'
require './toyrobot/Robot'

describe 'RobotCommands::MoveWest' do
  let(:robot) { Robot.new(Direction.new.face(:WEST), TablePosition.new(1,1)) }

  it 'Moves robot WEST' do
    RobotCommands::MoveWest.new(robot, TableTop.new).execute
    robot.position.x.should eq(0)
  end
end