class Mastermind
  attr_accessor :answer, :guesses, :max_guesses
  def initialize(answer)
    @answer = answer
    @guesses = []
    @max_guesses = 8
  end

  def guess(set)
    peg_set = set.map {|c| Peg.new(c)}
    intersect = (@answer|peg_set).flat_map do |s|
      [s]*[@answer.count(s), peg_set.count(s)].min
    end
    in_set = intersect.count
    in_pos = @answer.zip(peg_set).count {|a,b| a == b}
    @guesses << {set: peg_set, black: in_pos, white: in_set - in_pos}
  end
end
