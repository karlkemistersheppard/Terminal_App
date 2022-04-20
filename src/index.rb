require 'emoji_regex'
require 'colorize'
require 'tty-prompt'
require 'tty-progressbar'
require_relative "./data.rb"

#ARGV COMMAND LINE ARGUMENT====================
game_title = "Dragons Lair"
user_name = "Name"

game_title = ARGV[0] if ARGV[0]
user_name = ARGV[1] if ARGV[1]

puts "Welcome to #{game_title}, fellow warrior #{user_name}!"
#ARGV COMMAND LINE ARGUMENT==========END==========

character = data_character
gender = data_gender
tools = data_tools
potion = data_potion
choice = start

#LOGO AND INTRO MUSIC ========================================================================================================================================
$process_id = spawn "afplay -v 0.2 It_Is_Coming_-_David_Fesliyan.mp3" 
puts "\n""\n""\n"                                         
puts $dragon_lair_logo
#LOGO AND INTRO MUSIC====================================================END====================================================================================


# USER NAME========================================================================================================================================
puts "So I can tell your fellow citizens about your adventure, please enter a unique character name." + " Be Creative".green
$character_name = STDIN.gets.chomp.magenta


#INTRO MESSAGE========================================================================================================================================
puts "Welcome #{$character_name}, you are about to embark on a mystical journey to slay a fire breathing " + $dragon + "but before we get started, we need to build you a character"


#TTY PROMPT=========================================================================================================================================
puts tty_prompt_start
#TTY PROMPT===================================================END======================================================================================


#DOWNLOADING BAR========================================================================================================================================
system "clear"
puts "Congratulations #{$character_name}, you are the first #{$gender} #{$race} to embank on such a dangerous journey, you have decided to grab #{$tool} as your tool to protect youself and have a vial of #{$potion} #{$potion_emoji}"
puts "\n"
bar = TTY::ProgressBar.new("Preparing your Adventure #{$character_name} [:bar]".colorize(:blue), total: 45) # Added TTY Progress bar showing quiz is downloading for UX
45.times do
  sleep(0.1)
  bar.advance  # by default increases by 1
end
#DOWNLOADING BAR================================================END========================================================================================


puts "\n"


#START OF THE ADVENTURE ========================================================================================================================================
puts "#{$character_name} can you hear me....." + "wispers".italic + " my name is #{$book_reader.yellow}, I am here to help you on your adventure...lets head to the edge of town to start our journey."
sleep(4)
puts "Fearless #{$race} you have arrived at your first destination, you are standing In front of Blood Moons Forest and tonight the moon is alive #{$moon}" 
puts "The trees are talking, and you try to forget about the myths you have heared......" 
puts "#{$book_reader.yellow}" + " wispers anyone that has entered the forest has never been seen again".italic
puts "\n"
sleep(3)
puts "Your now have to decide which direction you want to take? "


#FIRST PATH CHOICE========================================================================================================================================
puts "Choose your path #{$character_name}" + " (left/right)".green
$user_choice1 = STDIN.gets.chomp
system "clear"

#FIRST CHOICE IN DIRECITONAL PATH=======================================================================================================================================
puts user_choice1



#LEFT PATH MAIN=======================================================================================================================================
puts user_choice_bridge

#DO YOU WISH TO CROSS THE RIVER=======================================================================================================================================
puts river_cross

#CROSS RIVER YES/NO=======================================================================================================================================
puts river_cross_answer

#BEVERAGE CHOICE=======================================================================================================================================
puts beverage_choice




system "clear"


#====================RIDDLES START=====================================
#Enter Cave
puts cave_enter

# Riddle 1
puts riddle_1
puts "\n"
puts "\n"

#Riddle 2
puts riddle_2
puts "\n"
puts "\n"

#Riddle 3
puts riddle_3
puts "\n"
puts "\n"
#====================RIDDLES END====================================


#====================INSERTING KEYS START=====================================
puts tty_progress_key_audio
#====================INSERTING KEYS END=====================================
puts "\n"
puts "\n"
#====================UNLOCKING DOOR START=================================
puts unlock_secret_door
#===================UNLOCKING DOOR END=====================================

puts "\n"
sleep(1)
puts "The door is open says #{$book_reader.yellow}"
sleep(1)
puts "No one has ever got this far and survived......"
puts "You walk in, and are dazzled by the moutain of treasure and notice something moving in the shadows....." 
sleep(3)
puts "\n"

process_id = spawn "afplay Dragon.mp3"
sleep(12)

#DRAGON ENCOUNTER
puts dragon_encounter
#DRAGON ENCOUNTER END


#User Choice Dragon Left==========================================================================================================================================
puts dragon_run_direction_left
#User Choice Dragon Left ENDING==========================================================================================================================================


#User Choice Dragon Right==========================================================================================================================================
puts dragon_run_direction_right
#User Choice Dragon Right ENDING==========================================================================================================================================


# Process.kill("SIGKILL", $process_id)
#User Choice Dragon Right ENDING==========================================================================================================================================




system("killall afplay")