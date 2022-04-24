
#RUBY GEMS IMPORT FUNCTIONS FROM GEMFILE - File/Method Location * Gemfile
require 'emoji_regex'
require 'colorize'
require 'tty-prompt'
require 'tty-progressbar'
#END

#IMPORT DATA.RB FILE THAT CONTAINS LINKS TO .RB FILES FOR THE PROGRAM - File/Method Location *data.rb
require_relative "./data.rb"
#END

#ARGV COMMAND LINE ARGUMENT
game_title = "Dragons Lair" #prints to the start of the program as a message
user_name = "Name" #prints to the start with the game_title as below puts message.
$fail_message = "YOU FAILED" #prints after user fails game via $glabal var => string interpolation.
game_title = ARGV[0] if ARGV[0]
user_name = ARGV[1] if ARGV[1]
fail_message = ARGV[2] if ARGV[2] #This was created to add additional feature when the user fails their run.
puts "Welcome to #{game_title}, fellow warrior #{user_name}!"
#END

#HOW TO PLAY TTY-PROMPT - File/Method Location *methods.rb 2-46
puts tty_prompt_instructions
#END

system "clear"

#LOGO AND INTRO MUSIC
$process_id = spawn "afplay -v 0.2 It_Is_Coming_-_David_Fesliyan.mp3" #
puts "\n""\n""\n"                                         
puts $dragon_lair_logo # - File/Method Location * $global_var 28
#END

# CREATE CUSTOM CHARACTER NAME  - File/Method Location *methods.rb 49-59
puts create_character_name
$character_name = $character_name.magenta #adding colorize gem to set the color as a #global color so it always prints to the color set.
#END

#INTRO MESSAGE + STRING INTERPOLATION & USE OF $GLOBAL VARIABLE
system "clear"
puts "Welcome #{$character_name}, you are about to embark on a mystical journey to slay a fire breathing " + $dragon + "but before we get started, we need to build you a character"
puts "\n"
puts "\n"
#END

#TTY PROMPT CHARACTER - File/Method Location *methods.rb 62-87
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
#Could not run the Progress Bar in its own method as its was causing strange print values to screen without error codes/prompts.
puts "Congratulations #{$character_name}, you are the first #{$gender} #{$race} to embank on such a dangerous journey, you have decided to grab #{$tool} as your weapon to protect youself, and you took 1 vial of #{$potion} #{$potion_emoji}"
puts "\n"
sleep(10)
bar = TTY::ProgressBar.new("Preparing your Adventure #{$character_name} [:bar]".colorize(:blue), total: 45) # Added TTY Progress bar showing quiz is downloading for UX
45.times do
  sleep(0.1)
  bar.advance
end
sleep(3)
system "clear"
#END

#START OF THE ADVENTURE - File/Method Location *methods.rb 90-105
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

#FIRST CHOICE IN DIRECITONAL PATH - File/Method Location *methods.rb 107-115
puts user_choice1
#END

system "clear"

#LEFT PATH BRIDGE - File/Method Location *methods.rb 118-130
puts user_choice_bridge
#END

system "clear"

#BEVERAGE ANSWER - File/Method Location *methods.rb 132-150
puts user_choice_bridge_answer
#END

#DO YOU WISH TO CROSS THE RIVER - File/Method Location *methods.rb 153-163
puts river_cross
#END

system "clear"

#CROSS RIVER YES/NO - File/Method Location *methods.rb 165-198
puts river_cross_answer
#END

system "clear"

#BEVERAGE CHOICE - File/Method Location *methods.rb 201-225
puts beverage_choice
#END

system "clear"

#ENTER CAVE - File/Method Location *methods.rb 228-251
puts cave_enter
#END

#RIDDLES START - File/Method Location *methods.rb 254-428
puts riddles
#END

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
#END

#UNLOCKING SECRET DOOR
bar = TTY::ProgressBar.new("Unlocking Secret Door [:bar]".colorize(:blue), total: 35) # Added TTY Progress bar showing quiz is downloading for UX
    45.times do
    sleep(0.1)
    bar.advance  # by default increases by 1
end
sleep(4)
system "clear"
puts door_opening # - File/Method Location *methods.rb 402-412

process_id = spawn "afplay Dragon.mp3"
sleep(12)
#END

#DRAGON ENCOUNTER - File/Method Location *methods.rb 415-428
puts dragon_encounter
#END

#USER CHOICE DRAGON LEFT - File/Method Location *methods.rb 431-513
puts dragon_run_direction_left
#END

#USER CHOICE DRAGON RIGHT - File/Method Location *methods.rb 516-586
puts dragon_run_direction_right
#END

system("killall afplay")
