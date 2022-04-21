
#RUBY GEMS IMPORT FUNCTIONS FROM GEMFILE
require 'emoji_regex'
require 'colorize'
require 'tty-prompt'
require 'tty-progressbar'
#END

#IMPORT DATA.RB FILE THAT CONTAINS LINKS TO .RB FILES FOR THE PROGRAM
require_relative "./data.rb"
#END

#ARGV COMMAND LINE ARGUMENT
game_title = "Dragons Lair"
user_name = "Name"
game_title = ARGV[0] if ARGV[0]
user_name = ARGV[1] if ARGV[1]
puts "Welcome to #{game_title}, fellow warrior #{user_name}!"
#END

#HOW TO PLAY TTY-PROMPT
puts tty_prompt_instructions
#END

system "clear"

#LOGO AND INTRO MUSIC
$process_id = spawn "afplay -v 0.2 It_Is_Coming_-_David_Fesliyan.mp3" 
puts "\n""\n""\n"                                         
puts $dragon_lair_logo
#END

# CREATE CUSTOM CHARACTER NAME
puts create_character_name
$character_name = $character_name.magenta
#END

#INTRO MESSAGE + STRING INTERPOLATION & USE OF $GLOBAL VARIABLE
system "clear"
puts "Welcome #{$character_name}, you are about to embark on a mystical journey to slay a fire breathing " + $dragon + "but before we get started, we need to build you a character"
puts "\n"
puts "\n"
#END

#TTY PROMPT CHARACTER
puts gender_selction
system "clear"
puts race_selection
system "clear"
puts tool_selection
system "clear"
puts potion_selection
#END

system "clear"

#INCLUDES CALLING $GLOBAL VARIABLES AND GEM UNICODE + TTY-PROMPT PROGRESS BAR GEM
puts "Congratulations #{$character_name}, you are the first #{$gender} #{$race} to embank on such a dangerous journey, you have decided to grab #{$tool} as your weapon to protect youself and have a vial of #{$potion} #{$potion_emoji}"
puts "\n"
bar = TTY::ProgressBar.new("Preparing your Adventure #{$character_name} [:bar]".colorize(:blue), total: 45) # Added TTY Progress bar showing quiz is downloading for UX
45.times do
  sleep(0.1)
  bar.advance
end
sleep(3)
system "clear"
#END


#START OF THE ADVENTURE
puts intro_story
#END


#FIRST PATH CHOICE
#Updated from std user input to control the flow and the user by entering in a non valid input or hitting enter without selecting a true path.
require "tty-prompt"
$prompt = TTY::Prompt.new
choice = %w(left right)
$user_choice1 = $prompt.select("Choose your path #{$character_name}", choice)
#END
puts "\n""\n""\n"
#FIRST CHOICE IN DIRECITONAL PATH=======================================================================================================================================
puts user_choice1
#END

system "clear"

#LEFT PATH MAIN=======================================================================================================================================
puts user_choice_bridge

system "clear"

puts user_choice_bridge_answer

#DO YOU WISH TO CROSS THE RIVER=======================================================================================================================================
puts river_cross
#END

system "clear"

#CROSS RIVER YES/NO=======================================================================================================================================
puts river_cross_answer

system "clear"

#BEVERAGE CHOICE=======================================================================================================================================
puts beverage_choice

system "clear"

#ENTER CAVE
puts cave_enter

#====================RIDDLES START=====================================
#Note: Tried to Modularize the below riddles into their worn seperate modules so i could call them into index.rb and it cause the riddle structure to break, tired to error handle- education support advised to move it back to index.rb.
puts riddles
#====================RIDDLES END====================================


#====================INSERTING KEYS START=====================================

#TTY-PROMPT UNLOCKING KEYS + AUDIO FILES
bar = TTY::ProgressBar.new("Insert your first key #{$key_emoji}".colorize(:green), total: 1) # Added TTY Progress bar showing quiz is downloading for UX
    1.times do
    sleep(0.5)
    bar.advance  # by default increases by 1
end
process_id = spawn "afplay unlock.mp3"

sleep(1)

bar = TTY::ProgressBar.new("Insert your second key #{$key_emoji}".colorize(:green), total: 1) # Added TTY Progress bar showing quiz is downloading for UX
    1.times do
    sleep(0.5)
    bar.advance  # by default increases by 1
end
process_id = spawn "afplay unlock.mp3"

sleep(1)

bar = TTY::ProgressBar.new("Insert your third key #{$key_emoji}".colorize(:green), total: 1) # Added TTY Progress bar showing quiz is downloading for UX
    1.times do
    sleep(0.5)
    bar.advance  # by default increases by 1
end
process_id = spawn "afplay unlock.mp3"
sleep(2)

#UNLOCKING SECRET DOOR
bar = TTY::ProgressBar.new("Unlocking Secret Door [:bar]".colorize(:blue), total: 35) # Added TTY Progress bar showing quiz is downloading for UX
    45.times do
    sleep(0.1)
    bar.advance  # by default increases by 1
end
sleep(4)
system "clear"
puts door_opening

process_id = spawn "afplay Dragon.mp3"
sleep(12)

#DRAGON ENCOUNTER
puts dragon_encounter
#DRAGON ENCOUNTER END

#USER CHOICE DRAGON LEFT
puts dragon_run_direction_left
#END

#USER CHOICE DRAGON RIGHT
puts dragon_run_direction_right
#END

system("killall afplay")
