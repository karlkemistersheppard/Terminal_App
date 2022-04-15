
require 'emoji_regex'
require 'colorize' #puts "This is green".green
require 'tty-prompt'
require 'tty-progressbar'

require_relative "./data.rb"

character = data_character
gender = data_gender
tools = data_tools
potion = data_potion
choice = start
#Checking Method Arrays are Working
# print character
# puts gender[0,1]
# print tools
# print potion
# print choice

#Beginging of the Story
$process_id = spawn "afplay It_Is_Coming_-_David_Fesliyan.mp3" 
                                         
puts "
██████╗     ██████╗      █████╗      ██████╗      ██████╗     ███╗   ██╗    ███████╗
██╔══██╗    ██╔══██╗    ██╔══██╗    ██╔════╝     ██╔═══██╗    ████╗  ██║    ██╔════╝
██║  ██║    ██████╔╝    ███████║    ██║  ███╗    ██║   ██║    ██╔██╗ ██║    ███████╗
██║  ██║    ██╔══██╗    ██╔══██║    ██║   ██║    ██║   ██║    ██║╚██╗██║    ╚════██║
██████╔╝    ██║  ██║    ██║  ██║    ╚██████╔╝    ╚██████╔╝    ██║ ╚████║    ███████║
╚═════╝     ╚═╝  ╚═╝    ╚═╝  ╚═╝     ╚═════╝      ╚═════╝     ╚═╝  ╚═══╝    ╚══════╝

                    ██╗          █████╗     ██╗    ██████╗
                    ██║         ██╔══██╗    ██║    ██╔══██╗
                    ██║         ███████║    ██║    ██████╔╝
                    ██║         ██╔══██║    ██║    ██╔══██╗
                    ███████╗    ██║  ██║    ██║    ██║  ██║
                    ╚══════╝    ╚═╝  ╚═╝    ╚═╝    ╚═╝  ╚═╝
".red
puts "\n"
puts "\n"
puts "Welcome to Dragons Lair"
puts "So can tell your fellow citizens of your adventure, please tell me your name"
$character_name = gets.chomp.magenta

#TTY Prompt to for user to interact and create character.
puts "Welcome #{$character_name}, you are about to embark on a mystical journey to slay a fire breathing " + $dragon+ "Before we get started, we need to build a character"
$prompt = TTY::Prompt.new

def start_options
    answer = $prompt.select("+ ", ["Gender","Race","Tool","Potions","Exit"])
end

# Gender Select
def select_gender
    gender = $prompt.select("Select your characters gender #{$gender_emoji}",$gender,["Male", "Female"])
end

#Character Select
def select_character
    race = $prompt.select("Select your race #{$character_emoji}",$character,["Witcher", "Human", "Blood Elvf", "Night Crawler", "Warthog", "Soul Reaper", "Spartan", "Iron Dwarf", "Kree Warrior"])
end

#Tool Select
def select_tool
    tool = $prompt.select("Select a Tool #{$sword_emoji}",$tools,["Infinity Gauntlet","Darkhold Blade", "Mjolnir", "Gold Fist", "Liquid Sword", "nothing"])
end
#Potion Select
def select_potion
    potion = $prompt.select("Select a potion #{$potion_emoji}",$potion,["Wolf Blood", "Vital Essence", "Oort Brew", "Soul Dealer", "Dragon Breath"])
end



system "clear"
option =""
while option != "Exit"
    option = start_options
    case option
    when "Gender"
        gender = select_gender
        # puts gender
    when "Race"
        race = select_character
        # puts race
    when "Tool"
        tool = select_tool
        # puts tool
    when "Potions"
        potion = select_potion
        # puts potion
    else
    puts "Exit"
    end
end 
system "clear"
puts "Congratulations #{$character_name}, you are the first #{gender} #{race} to embank on such a dangerous journey, you have decided to grab #{tool} as your tool to protect youself with and have 1 vial of #{potion} #{$potion_emoji}"
puts "\n"
bar = TTY::ProgressBar.new("Preparing your Adventure [:bar]".colorize(:blue), total: 45) # Added TTY Progress bar showing quiz is downloading for UX
45.times do
  sleep(0.1)
  bar.advance  # by default increases by 1
end
puts "\n"

# Start of the adventure
puts "#{$character_name} can you hear me....." + "wispers".italic + " my name is #{$book_reader.yellow}, I am here to help you on your adventure...lets head to the edge of town to start our journey."
sleep(4)
puts "You have arrived In front of you is a dark forest, there are myths that told around the town that anyone that has entered the forest has never been seen again"
sleep(3)
puts "You need to decide which direction you want to take? "

# Method for First Choice
puts "You have a choice... take the path to the left or the right? (type left or right)"
user_choice1 = gets.chomp
system "clear"
if user_choice1 == "left"
    puts "You have decided to take the left path"
elsif user_choice1 == "right"
    puts "You have decided to take the right path"
end

if user_choice1 == "left"
    puts "You walk for 1 day until you reach a cliff.  You look over to the otherside of the canyon and notice a old bridge that leads to where you need to go, BUT the bridge looks like it might break..."
    puts "Do you want to take the chance and cross the bridge? yes/no"
    user_choice1_left = gets.chomp
    system "clear"

    if user_choice1_left == "yes"
        puts "You step out onto the bridge, and the support rope breaks... and you have fallen to your death #{$death_emoji}(Restart Game)"
        system("killall afplay")
        return
    elsif user_choice1_left == "no"
        puts "You look around and notice a narrow path that leads to a cave and decide to take that path."
        puts "You finally make your way through the cave and walk out into the light.  Across the field you see a tavern on the otherside of the river"
    end
end

# Methoid for First Choice END

if user_choice1 == "right" || user_choice1_left == "no"
    puts "You walk across the field until you reach a river"
    puts "Do you wish to cross the river? yes/no"
    user_choice_river = gets.chomp
end
system "clear"

if user_choice_river == "yes"
    puts "You cross the river and find a tavern on the otherside offering free beverages"
    puts "You take the offer and head inside"
    puts "You are greated by a old lady that looks like a Witch but she offers you a glass of water from a bucket or a wine left over from merchant."
    puts "You are thirsty, so you choose? water/wine (type water or wine)"
    user_choice_beverage = gets.chomp
    system "clear"
elsif user_choice_river == "no"
    puts "You decide to not to cross, but didnt realise that you where poisoned by something in the forest.... your only option is to take the #{$potion} you have, but it poisons you resulting in your DEATH #{$death_emoji}(Restart Game)"
    system("killall afplay")
    return
end

    if user_choice_beverage == "water"
        puts "You drink the water and immediatly feel strange...."
        puts "The old lady laughs, and you realise she poisened the water"
        puts "Moments later you die from the poison"
        system("killall afplay")
        return
    end

    if user_choice_beverage == "wine"
        puts "You drink the wine, and feel refreshed"
        puts "You have a rest for 10 min, then head out to continue on your adventure"
    end
    system "clear"

puts "After half a days walk you finally across slinters ridge and up lightning mountain you arrive at the enterance to the Dragons Lair"
sleep(4)
puts "As you walk up to the cave you cant ignore the fear in your starting to feel in your chest"
puts "But you tell yourself, i must go on..."
sleep(2)
Process.kill("SIGKILL", $process_id)
process_id = spawn "afplay Walking_into_Dungeon.mp3"
puts "As you walk up to the main enterance to the dungeon and past the wet dripping walls, you notice a large door begins to open......... as you walk though the door closes behind you and locks."


# Riddle 1

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
    user_guess = gets.chomp()
    current_count += 1 #increments their guess count by one

    else
    out_of_guesses = true #this means the user has no more guesses left which changes the condition to true from false ending the program
    end

end

if out_of_guesses #calls in the out ofguesses variable
puts "You are out of guesses, the floor just opened up and you fell to your death #{$death_emoji}"
puts "Restart Game"
system("killall afplay")
return #Terminates the Game
else

puts "Well done #{$character_name} you have passed the first Riddle by guessing the correct answer".green + " (#{user_guess})".yellow
puts "Please take your #{$key_emoji}"
end
puts "\n"
puts "\n"

#Riddle 2
correct_answer = "echo"
user_guess = ""
current_count = 0
count_limit = 3
out_of_guesses = false

sleep(2)
puts "So you passed my first test, its wont happen again..."
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
    user_guess = gets.chomp()
    current_count += 1 #increments their guess count by one

    else
    out_of_guesses = true #this means the user has no more guesses left which changes the condition to true from false ending the program
    end

end

if out_of_guesses #calls in the out ofguesses variable
puts "You are out of guesses, the floor just opened up and you fell to your death #{$death_emoji}"
puts "Restart Game"
system("killall afplay")
return #Terminates the Game
else

puts "Well done #{$character_name} you have passed the second Riddle by guessing the correct answer ".green + "#{user_guess}".yellow
puts "Please take your #{$key_emoji}"
end
puts "\n"
puts "\n"

#Riddle 3
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
    user_guess = gets.chomp()
    current_count += 1 #increments their guess count by one

    else
    out_of_guesses = true #this means the user has no more guesses left which changes the condition to true from false ending the program
    end

end

if out_of_guesses #calls in the out ofguesses variable
puts "You are out of guesses, the floor just opened up and you fell to your death #{$death_emoji}"
puts "Restart Game"
system("killall afplay")
return #Terminates the Game
else

#Adding keys to the locks with time delay sleep() function=========================================================
puts "Well done #{$character_name} you have unlocked the secret passage to the Dragons Lair by guessing".green + " #{user_guess} #{$fire_emoji}".yellow, + " prepare yourself.....".green
puts "\n"
puts "Please take your #{$key_emoji}"
end
puts "\n"
puts "\n"
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
sleep(1)

#====================inserting keys end=====================================

puts "\n"
bar = TTY::ProgressBar.new("Unlocking Secret Door [:bar]".colorize(:blue), total: 35) # Added TTY Progress bar showing quiz is downloading for UX
45.times do
  sleep(0.1)
  bar.advance  # by default increases by 1
end
puts "\n"
sleep(1)
puts "The door is open says #{$book_reader.yellow}"
sleep(1)
puts "No one has ever got this far and survived......"
puts "You walk in, and are dazzled by the moutains of #{$treasure_emoji}" 
sleep(3)
puts "\n"

process_id = spawn "afplay Dragon.mp3"










sleep(12)
system("killall afplay")