require_relative 'peg'
require_relative 'game'
require_relative 'view'

answer = Array.new(4) { Peg.new }
game = Mastermind.new(answer)
view = MastermindView.new

view.reset_screen
puts "Welcome to Mastermind, enter a guess to play"
puts "or type 'help' for more info:"

while(true)
  input = gets.chomp
  words = input.split(' ')
  case words[0]
  when 'help'
    puts view.help
    next
  when 'guess'
    if words.length != 5
      puts "Wrong number of pegs"
      next
    end
    valid = game.guess(words[1..-1])
  end
  view.reset_screen
  puts view.render(game)
  p game.answer
end
