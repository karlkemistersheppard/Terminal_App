require 'colorize'

#TEST PASSED
$user_choice1 = ""
while true
    puts "Choose your path #{$character_name}" + " (left/right)".green
    $user_choice1 = STDIN.gets.chomp
    $user_choice1.empty? ? (puts "Direction Required") : break
end

#CREATE USER CHARACTER NAME
#TEST PASSED
puts "So I can tell your fellow citizens about your adventure, please enter a unique character name." + " Be Creative".green
$character_name = ""
while true
    puts "Please enter your characters name?"
    $character_name = STDIN.gets.chomp.magenta
    $character_name.empty? ? (puts "Character name required") : break
end


#TEST PASSED
require "tty-prompt"
$prompt = TTY::Prompt.new
choice = %w(left right)
$user_choice1 = $prompt.select("Choose your path #{$character_name}", choice)

#TEST PASSED
require "tty-prompt"
$prompt = TTY::Prompt.new
choice = %w(yes no)
$user_choice1_left = $prompt.select("Do you want to take the chance and cross the bridge #{$character_name}", choice)

#TEST PASSED
require "tty-prompt"
$prompt = TTY::Prompt.new
choice = %w(yes no)
$user_choice_river = $prompt.select("Do you wish to cross the river #{$character_name}", choice)

#TEST PASSED
require "tty-prompt"
$prompt = TTY::Prompt.new
choice = %w(water wine)
$user_choice_beverage = $prompt.select("You are thirsty, so you have to choose one... #{$character_name}", choice)

#TEST PASSED
require "tty-prompt"
$prompt = TTY::Prompt.new
choice = %w(left right)
$user_choice_dragon = $prompt.select("You have a choice... you can either run to the left or the right... #{$character_name}", choice)

#TEST PASSED
require "tty-prompt"
$prompt = TTY::Prompt.new
choice = %w(yes no)
$user_choice_attack = $prompt.select("Do you pull use the #{$tool} and attack the dragon? #{$character_name}", choice)

#TEST PASSED
require "tty-prompt"
$prompt = TTY::Prompt.new
choice = %w(yes no)
$second_chance = $prompt.select("Do you wish ask for forgivness from the dragon and offer your service #{$character_name}", choice)

#TEST PASSED
require "tty-prompt"
$prompt = TTY::Prompt.new
choice = %w(yes no)
$user_choice_attack = $prompt.select("Do you use the #{$tool} and attack the dragon #{$character_name}", choice)


