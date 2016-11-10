class Peg
  COLORS = ["red", "green", "blue", "yellow", "brown", "orange", "black", "white"]

  attr_reader :color_index
  def initialize(color)
    @color_index = COLORS.index(color)
  end

  def color
    COLORS[@color_index]
  end

  def ==(other_peg)
    @color_index == other_peg.color_index
  end
end
