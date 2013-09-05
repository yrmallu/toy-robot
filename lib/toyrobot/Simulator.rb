class Simulator
  attr_accessor :robot, :tabletop

  def initialize
    @tabletop = TableTop.new(5,5)
  end

  # @param String line
  def processline(line)
    match = extractcommand(line)
    begin
      if match[1] == 'PLACE'
        place(match[2].to_i, match[3].to_i, match[4].to_sym)
      elsif !@robot.nil?
        case match[0]
          when 'MOVE'
            move
          when 'LEFT'
            left
          when 'RIGHT'
            right
          when 'REPORT'
            report
          else
            #do nothing
        end
      end if match
    rescue StandardError
      #we can ignore these as it simply means a standard command has failed, e.g. invalid position/type/etc
    end
  end

  # @param integer x
  # @param integer y
  # @param string facing
  def place(x, y, facing)
    if @tabletop.position_on_table?(TablePosition.new(x,y))
      @robot = Robot.new(Direction.new.face(facing), TablePosition.new(x,y))
    end
  end

  def move
    RobotCommands::MoveRobot.new(@robot, @tabletop).execute
  end

  def left
    RobotCommands::TurnLeft.new(@robot).execute
  end

  def right
    RobotCommands::TurnRight.new(@robot).execute
  end

  def report
    RobotCommands::Report.new(@robot).execute
  end

  # @param string line
  def extractcommand(line)
    /^MOVE$|^LEFT$|^RIGHT$|^REPORT$|^(PLACE)\s(\d),(\d),(.*)$/.match(line)
  end
end
