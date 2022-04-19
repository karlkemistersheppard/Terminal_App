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
# $process_id = spawn "afplay -v 0.2 It_Is_Coming_-_David_Fesliyan.mp3" 
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
user_choice1 = STDIN.gets.chomp
system "clear"
if user_choice1 == "left"
    puts "You take the left path"
elsif user_choice1 == "right"
    puts "You take the right path"
end
#FIRST PATH CHOICE====================================================END====================================================================================
#LEFT PATH MAIN=======================================================================================================================================
if user_choice1 == "left"
    puts "You walk for 1 day until you reach a cliff #{$mountain_cliff}."  
    puts "You look over to the otherside of the canyon and notice a old bridge that leads to where you need to go, BUT the bridge looks like it might break..."
    puts "Do you want to take the chance and cross the bridge?" + " (yes/no)".green
    user_choice1_left = STDIN.gets.chomp
    system "clear"

    if user_choice1_left == "yes"
        puts "You step out onto the bridge, and the support rope breaks... and you have fallen to your death #{$death_emoji}" + "(Restart Game)".red
        sleep(4)
        system "clear"
        puts $try_again
        Process.kill("SIGKILL", $process_id)
        $process_id = spawn "afplay -v 0.2 fail_effect.mp3" 
        # system("killall afplay")
        return
    elsif user_choice1_left == "no"
        puts "You look around and notice a narrow path that leads to a cave near some large trees #{$tree}."
        puts "#{$character_name} you have finally made your way through the cave and walk out into the light."  
        puts "Across the field you see a creepy tavern on the otherside of a rocky river"
    end
end
# Methoid for First Choice END

if user_choice1 == "right" || user_choice1_left == "no"
    puts "You walk across the field until you reach a river"
    puts "Do you wish to cross the river?" + " (yes/no)".green
    user_choice_river = STDIN.gets.chomp
end
system "clear"

if user_choice_river == "yes"
    puts "You cross the river and find a tavern on the otherside offering free beverages #{$beverage}"
    puts "You take the offer and head inside"
    puts "You are greated by a old lady that looks like a Witch but she offers you a glass of" 
    puts "\n"
    puts "1. Stale murky water #{$water}"
    puts "2. Dirty glass of wine #{$wine}"
    puts "\n"
    puts "You are thirsty, so you have to choose one..." + " type (water/wine)".green
    user_choice_beverage = STDIN.gets.chomp
    system "clear"

elsif user_choice_river == "no"
    puts "You decide to not to cross, but didnt realise that you where poisoned by something in the forest.... your only option is to take the #{$potion} you have, but it poisons you resulting in your DEATH #{$death_emoji}(Restart Game)"
    sleep(4)
    system "clear"
    Process.kill("SIGKILL", $process_id)
    puts $try_again
    $process_id = spawn "afplay -v 0.2 fail_effect.mp3" 
    # system("killall afplay")
    return
end

if user_choice_beverage == "water"
    puts "You drink the water and immediatly feel strange...."
    $process_id = spawn "afplay -v 0.2 Scary_Witch.mp3" 
    sleep(2)
    puts "The old lady laughs, and you realise she poisened the water"
    puts "You drop the cup and fall to your knees"
    $process_id = spawn "afplay -v 0.2 item_drop.mp3" 
    puts "Moments later you die from the poison"
    sleep(4)
    system "clear"
    puts $try_again
    Process.kill("SIGKILL", $process_id)
    system("killall afplay")
    $process_id = spawn "afplay -v 0.2 fail_effect.mp3" 
    return
end

if user_choice_beverage == "wine"
    puts "You take a seat and finish your wine #{$wine}"
    puts "But before you know it you have leave to continue on your adventure"
end

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

puts "ITS A DRAGON..."


puts "You have a choice... you can either run to the left or the right...(type left or right)"
user_choice_dragon = STDIN.gets.chomp
system "clear"
if user_choice_dragon == "left"
    puts "You have decided to run to the left"
elsif user_choice_dragon == "right"
    puts "You have decided to run to the right"
end

#User Choice Dragon Left==========================================================================================================================================
if user_choice_dragon == "left"
    puts "You run to the left and slip on a pile of bones...."
    puts "You hear the dragons wings flap and you freeze"
    puts "Before you realise the dragon is standing in front of you"
    puts "Do you pull use the #{$tool} and attack the dragon? yes/no"
    user_choice_attack = STDIN.gets.chomp
    

    if user_choice_attack == "yes" && potion != "Dragon Breath"
        puts "You attempt to use the #{$tool} on the dragon but before you can do anyhting it swips you off your feet and burns you with its firey breath..... #{$death_emoji}(Restart Game)"
        system "clear"
        puts $try_again
        Process.kill("SIGKILL", $process_id)
        $process_id = spawn "afplay -v 0.2 fail_effect.mp3" 
        system("killall afplay")
        return
    #Second Chance Life BASED on Potion Selection..
    elsif user_choice_attack == "yes" && potion == "Dragon Breath"
        puts "You attempt to use the #{$tool} on the dragon but before you can do anyhting it swips you off your feet and burns you with its firey breath..... #{$death_emoji}"
        sleep(2)
        puts "But wait...."
        sleep(1)
        puts "You have survived the first blast"
        puts "The dragon steps back and is confused ........"
        sleep(3)
        puts "You cant believe your luck.... your are still alive"
        sleep(1)
        puts "How..... am i alive"
        puts "You relise that you have survived the first blast from the dragon due to the #{potion} potion you selected at the beginning of your journey"
        puts "You now have to decide your fate as you realise that the potion is used its life."
        puts "Do you wish ask for forgivness from the dragon and offer your service? yes/no" 
        second_chance = STDIN.gets.chomp  
    end
end   
    
    if second_chance == "yes"
        puts "You bend the knee and drop the #{$tool}"
        $process_id = spawn "afplay -v 0.2 item_drop.mp3"
        puts "and ask for forgivness from the dragon"
        puts "The dragon excepts your offer and allows you to live"
        puts "\n""\n""\n"
        sleep(3)
        system "clear"
        puts $thank_you
        Process.kill("SIGKILL", $process_id)
        $process_id = spawn "afplay -v 0.2 fail_effect.mp3" 
        system("killall afplay")
        return
    elsif second_chance == "no"
        puts "The dragon swoops in and eats you #{$death_emoji}(Restart Game)"
        system "clear"
        puts $try_again
        Process.kill("SIGKILL", $process_id)
        $process_id = spawn "afplay -v 0.2 fail_effect.mp3" 
        system("killall afplay")
        return

    elsif user_choice_attack == "no"
        puts "You drop the #{$tool} on the floor and tell the dragon you are there to offer your protection"
        puts "The dragon sits back and agrees to the offer, and allows you safe passage in and out of the lair"
        sleep(3)
        system "clear"
        puts $thank_you
        Process.kill("SIGKILL", $process_id)
        $process_id = spawn "afplay -v 0.2 fail_effect.mp3" 
        system("killall afplay")
        return
end
#User Choice Dragon Left ENDING==========================================================================================================================================


#User Choice Dragon Right==========================================================================================================================================

if user_choice_dragon == "right"
    puts "You run to the right and hide behind a large gold statue...."
    sleep(3)
    puts "You hear the dragons wings flap and you freeze"
    sleep(2)
    puts "Before you realise the dragon is standing in front of you waiting for your next move"
    sleep(3)
    puts "Do you pull use the #{$tool} and attack the dragon? yes/no"
    user_choice_attack = STDIN.gets.chomp

    if user_choice_attack == "no" && potion != "Dragon Breath"
        puts "You decide to drink the #{potion} and you start to feel strange..."
        sleep(2)
        puts "Something is wrong.."
        puts "The dragon begins to circle you"
        puts "Before you can decide on your next move, the dragon swings its large tail and knocks you across the room"
        puts "You have it the wall, and cant move....."
        puts "Wish your last breath you...."
        sleep(3)
        puts "The dragon ate you"
        system "clear"
        puts $try_again
        Process.kill("SIGKILL", $process_id)
        $process_id = spawn "afplay -v 0.2 fail_effect.mp3" 
        system("killall afplay")
        return
    
    elsif user_choice_attack == "no" && potion == "Dragon Breath"
        puts "You decide to drink the #{potion} and you start to feel strange..."
        sleep(2)
        puts "Something is wrong.."
        sleep(3)
        puts "You ears start to hurt, what is going on.... but wait you start to hear something, its a voice..."
        sleep(4)
        puts "Its.... the dragon the potion has given you the ability to hear its voice"
        sleep(3)
        puts "You speak, and the dragon takes a step back"
        sleep(2)
        puts "The dragon is amazed... YOU CAN UNDERSTAND ME it says"
        sleep(3)
        puts "Yes.. my name is #{$character_name}, i am a #{$race} from a town across the valley, i am here to protect you"
        sleep(2)
        puts "I was sent on this quest to find you"
        puts "You decide to ..........."
        
        sleep(8)
        puts $to_be_continued
        Process.kill("SIGKILL", $process_id)
        system("killall afplay")
        return
    
        
    elsif user_choice_attack == "yes" && potion == "Dragon Breath"
            puts "You attempt to use the .... you died#{$death_emoji}(Restart Game)"
            system "clear"
            puts $try_again
            Process.kill("SIGKILL", $process_id)
            $process_id = spawn "afplay -v 0.2 fail_effect.mp3" 
            system("killall afplay")
            return
    elsif user_choice_attack == "yes" && potion != "Dragon Breath"
            puts "You attempt to use the #{potion} but before you can drink it the dragon eats you"
            system "clear"
            puts $try_again
            Process.kill("SIGKILL", $process_id)
            $process_id = spawn "afplay -v 0.2 fail_effect.mp3" 
            system("killall afplay")
            return
            

    end
end
Process.kill("SIGKILL", $process_id)
#User Choice Dragon Right ENDING==========================================================================================================================================
system("killall afplay")