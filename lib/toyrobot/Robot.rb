class Robot
  attr_accessor :direction, :position

  # @param Direction direction
  # @param Position position
  def initialize(direction, position)
    @direction = direction
    @position = position
  end
end
