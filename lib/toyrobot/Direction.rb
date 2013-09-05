class Direction
  attr_accessor :directions

  def initialize
    @directions = [:NORTH, :EAST, :SOUTH, :WEST]
  end

  def face(initial_facing)
    hash = Hash[@directions.map.with_index.to_a]

    raise StandardError if hash[initial_facing].nil?

    while current_direction != initial_facing
      turn_left
    end

    self
  end

  def turn_left
    @directions.unshift(@directions.pop)
  end

  def turn_right
    @directions.push(@directions.shift)
  end

  def current_direction
    @directions[0]
  end
end
