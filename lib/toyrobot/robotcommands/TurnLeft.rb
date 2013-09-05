module RobotCommands
class TurnLeft < RobotCommands::Command
  def initialize(robot)
    super(robot, TableTop.new)
  end

  def execute
    @robot.direction.turn_left
  end
end
end
