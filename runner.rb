require_relative 'peg'
require_relative 'game'
require_relative 'view'

game = Mastermind.new
view = MastermindView.new(game)

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
    unless valid
      puts "Your guess wasn't valid colors"
      next
    end
  else
    puts "invalid command"
  end
  view.reset_screen
  puts view.render
  break if game.over
end
