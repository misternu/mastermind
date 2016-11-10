class Peg
  COLORS = ["red", "green", "blue", "yellow", "orange", "purple"]

  attr_reader :c_index
  def initialize(color = nil)
    if color
      @c_index = COLORS.index(color)
    else
      @c_index = rand(COLORS.length)
    end
  end

  def color
    COLORS[@c_index]
  end

  def ==(other_peg)
    @c_index == other_peg.c_index
  end

  def hash
    @c_index.hash ^ Peg.hash
  end

  alias_method :eql?, :==
end
