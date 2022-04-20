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

puts tty_prompt_instructions
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
# system "clear"
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
# system "clear"

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

# system "clear"

#ENTER CAVE
puts cave_enter

#====================RIDDLES START=====================================
#Note: Tried to Modularize the below riddles into their worn seperate modules so i could call them into index.rb and it cause the riddle structure to break, tired to error handle- education support advised to move it back to index.rb.

#RIDDLE ONE
    correct_answer = "dragon"
    user_guess = ""
    current_count = 0
    count_limit = 3
    out_of_guesses = false
    
    puts "You wish to enter my Lair......."
    sleep(2)
    puts "\n"
    puts "Well then #{$character_name} lets play a game if you dare!!!"
    puts "\n"
    puts "To enter you need to guess three secret words, I will give you three chances for each riddle."
    puts "\n"
    puts "Riddle 1".yellow
    puts "\n"
    puts "- If you fail, your fate is sealed"
    puts "- I have a tail, but im not a dog"
    puts "- I have scales, but im not a snake"
    puts "- I have wings, but im not a eagle"
    puts "- Im a myth, but im real"
    puts "- I love gold, but cant spend it"
    puts "- What am I?"

    while user_guess != correct_answer and !out_of_guesses #means while the secret word is not correct and the out of guesses has not been exceeded the loop continues
        if current_count < count_limit #this means if the guess count is less than guess limit they have guesses left for the game
        puts "Guess: "
        user_guess = STDIN.gets.chomp()
        current_count += 1 #increments their guess count by one
    
        else
        out_of_guesses = true #this means the user has no more guesses left which changes the condition to true from false ending the program
        end
    end
    
    if out_of_guesses #calls in the out ofguesses variable
        puts "You are out of guesses, the floor just opened up and you fell to your death #{$death_emoji}"
        sleep(4)
        # system "clear"
        puts $try_again
        Process.kill("SIGKILL", $process_id)
        $process_id = spawn "afplay -v 0.2 fail_effect.mp3"
        system("killall afplay") 
        return
    elsif
        puts "Well done #{$character_name} you have passed the first Riddle by guessing the correct answer".green + " (#{user_guess})".yellow
        puts "Please take your #{$key_emoji}"
    end


#RIDDLE TWO
    correct_answer = "echo"
    user_guess = ""
    current_count = 0
    count_limit = 3
    out_of_guesses = false
    
    sleep(2)
    puts "So you passed my first test, it wont happen again..."
    puts "\n"
    puts "Riddle 2".yellow
    puts "\n"
    puts "I repeat every word you say, but I dont have a mouth"
    puts "You can hear me speek, but i cannot hear myself"
    puts "I exist, but you cant see me"
    puts "What am I?"
    while user_guess != correct_answer and !out_of_guesses #means while the secret word is not correct and the out of guesses has not been exceeded the loop continues
        if current_count < count_limit #this means if the guess count is less than guess limit they have guesses left for the game
        puts "Guess: "
        user_guess = STDIN.gets.chomp()
        current_count += 1 #increments their guess count by one
    
        else
        out_of_guesses = true #this means the user has no more guesses left which changes the condition to true from false ending the program
        end
    end
    
    if out_of_guesses #calls in the out ofguesses variable
        puts "You are out of guesses, the floor just opened up and you fell to your death #{$death_emoji}"
        sleep(4)
        system "clear"
        puts $try_again
        Process.kill("SIGKILL", $process_id)
        $process_id = spawn "afplay -v 0.2 fail_effect.mp3" 
        system("killall afplay")
        return
    else 
        puts "Well done #{$character_name} you have passed the second Riddle by guessing the correct answer ".green + "#{user_guess}".yellow
        puts "Please take your #{$key_emoji}"
    end



#RIDDLE THREE
    correct_answer = "fire"
    user_guess = ""
    current_count = 0
    count_limit = 3
    out_of_guesses = false
    
    sleep(2)
    puts "You got lucky that time, you will never guess the last quesiton as soo many have tried and failed...".green
    puts "\n"
    puts "Final Riddle".yellow
    puts "\n"
    puts "Lets play a game...."
    puts "If I eat I Live"
    puts "If I breathe I Live"
    puts "If I drink I Die"
    puts "What am I?"
    while user_guess != correct_answer and !out_of_guesses #means while the secret word is not correct and the out of guesses has not been exceeded the loop continues
        if current_count < count_limit #this means if the guess count is less than guess limit they have guesses left for the game
        puts "Guess: "
        user_guess = STDIN.gets.chomp()
        current_count += 1 #increments their guess count by one

        else
            out_of_guesses = true #this means the user has no more guesses left which changes the condition to true from false ending the program
        end
    
    end
    
    if out_of_guesses #calls in the out ofguesses variable
        puts "You are out of guesses, the floor just opened up and you fell to your death #{$death_emoji}"
        sleep(4)
        system "clear"
        puts $try_again
        Process.kill("SIGKILL", $process_id)
        $process_id = spawn "afplay -v 0.2 fail_effect.mp3" 
        system("killall afplay")
        return
    else
        #Adding keys to the locks with time delay sleep() function=========================================================
        puts "Well done #{$character_name} you have unlocked the secret passage to the Dragons Lair by guessing".green + " #{user_guess} #{$fire_emoji}".yellow, + " prepare yourself.....".green
        puts "\n"
        puts "Please take yours and insert them into the key holes on the wall"
    end

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