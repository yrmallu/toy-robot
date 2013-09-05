module RobotCommands
class MoveNorth < RobotCommands::Command
  def initialize(robot, tabletop)
    super(robot, tabletop)
  end

  def execute
    @robot.position.increase_y(1)

    if !@tabletop.position_on_table?(@robot.position)
      @robot.position.decrease_y(1)
    end
  end
end
end
