module RobotCommands
class TurnRight < RobotCommands::Command
  def initialize(robot)
    super(robot, TableTop.new)
  end

  def execute
    @robot.direction.turnright
  end
end
end
