require 'colorize'

# $user_choice1 = ""
# while true
#     puts "Choose your path #{$character_name}" + " (left/right)".green
#     $user_choice1 = STDIN.gets.chomp
#     $user_choice1.empty? ? (puts "Direction Required") : break
# end
puts "So I can tell your fellow citizens about your adventure, please enter a unique character name." + " Be Creative".green
$character_name = ""
while true
    puts "Please enter your characters name?"
    $character_name = STDIN.gets.chomp.magenta
    $character_name.empty? ? (puts "Character name required") : break
end

require "tty-prompt"
$prompt = TTY::Prompt.new
choice = %w(left right)
$user_choice1 = $prompt.select("Choose your path #{$character_name}", choice)
