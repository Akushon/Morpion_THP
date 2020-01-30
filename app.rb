$:.unshift File.expand_path("./../lib", __FILE__)
require 'board.rb'
require 'game.rb'
require 'player.rb'
require 'pry'
require 'colorize'
require 'colorized_string'

game = Game.new
game.game_launch #lancement de la partie !
