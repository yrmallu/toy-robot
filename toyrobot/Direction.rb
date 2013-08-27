class Direction
  attr_accessor :directions

  def initialize
    @directions = [:NORTH, :EAST, :SOUTH, :WEST]
  end

  def face(initial_facing)
    hash = Hash[@directions.map.with_index.to_a]

    raise StandardError if hash[initial_facing].nil?

    while currentdirection != initial_facing
      turnleft
    end

    self
  end

  def turnleft
    @directions.unshift(@directions.pop)
  end

  def turnright
    @directions.push(@directions.shift)
  end

  def currentdirection
    @directions[0]
  end
end
