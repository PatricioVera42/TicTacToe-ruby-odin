# frozen_string_literal: true

require './lib/game'
require './lib/player'

puts 'Select player1 name: '
player1 = gets.to_s.chomp
puts 'Select player2 name: '
player2 = gets.to_s.chomp

game = Game.new(player1, player2)

game.play
