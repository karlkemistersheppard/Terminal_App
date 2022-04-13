
require 'emoji_regex'
require 'colorize' #puts "This is green".green
require 'tty-prompt'
require 'tty-progressbar'

require_relative "./data.rb"

$gender = data
$gender = data
$tools = data
$potion = data

#Beginging of the Story
puts "Welcome to Dragon Slayer"
puts "So can tell your fellow citizens of your adventure, please tell me your name"
$character_name = gets.chomp

# #TTY Prompt to for user to interact and create character.

$prompt = TTY::Prompt.new

def start_options
    # puts "Welcome #{$character_name}, you are about to embark on a mystical journey to slay a fire breathing " + $dragon+ "Before we get started, we need to build a character"
    answer = $prompt.select("+ ", ["Gender","Race","Tool","Potions","Run Away"])
    # answer
end

system "clear"
option =""
while option != "Run Away"
    option = start_options
    case option
    when "Gender"
        puts ""
    when "Race"
        puts ""
    when "Tool"
        puts ""
    when "Potions"
        puts ""
    else
    puts "Why are you running Away!!!!!"
    end
end 

#NEED TO FIX LINK
puts male
puts male
puts infinity_gauntlet
puts kree_warrior

puts "#{$character_name}, you are the first of your kind to embank on such a journey, i hope you are prepared for the adventure...."

bar = TTY::ProgressBar.new("Preparing your Adventure [:bar]".colorize(:blue), total: 45) # Added TTY Progress bar showing quiz is downloading for UX
45.times do
  sleep(0.1)
  bar.advance  # by default increases by 1
end
