class BoundedPlanetSurface
  attr_reader :x_range, :y_range

  def initialize(max_x, max_y)
    @x_range = 0..max_x
    @y_range = 0..max_y
  end

  def position(position)
    if position_within_bounds?(position)
      position
    else
      lock_position_to_boundary(position)
    end
  end

  private
  def position_within_bounds?(position)
    x_range.include?(position.x) && y_range.include?(position.y)
  end

  def lock_position_to_boundary(position)
    x = clamp(position.x, x_range)
    y = clamp(position.y, y_range)
    Position.new(x, y)
  end

  def clamp(value, range)
    [range.min, value, range.max].sort[1]
  end
end