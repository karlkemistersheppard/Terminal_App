
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
puts "Welcome to Dragon Slayer"
puts "So can tell your fellow citizens of your adventure, please tell me your name"
$character_name = gets.chomp.magenta

#TTY Prompt to for user to interact and create character.

$prompt = TTY::Prompt.new

def start_options
    puts "Welcome #{$character_name}, you are about to embark on a mystical journey to slay a fire breathing " + $dragon+ "Before we get started, we need to build a character"
    # answer = $prompt.select("#{start.choice}")
    answer = $prompt.select("+ ", ["Gender","Race","Tool","Potions","Exit"])
    # answer
end

# Gender Select
def select_gender
    gender = $prompt.select("Select your characters gender #{$gender_emoji}",$gender,["Male", "Female"])
    # return gender
end

#Character Select
def select_character
    race = $prompt.select("Select your race #{$character_emoji}",$character,["Witcher", "Human", "Blood Elvf", "Night Crawler", "Warthog", "Soul Reaper", "Spartan", "Iron Dwarf", "Kree Warrior"])
    # return race
end

#Tool Select
def select_tool
    tool = $prompt.select("Select a Tool #{$sword_emoji}",$tools,["Infinity Gauntlet","Darkhold Blade", "Mjolnir", "Gold Fist", "Liquid Sword", "nothing"])
    return tool
end
#Potion Select
def select_potion
    potion = $prompt.select("Select a potion #{$potion_emoji}",$potion,["Wolf Blood", "Vital Essence", "Oort Brew", "Soul Dealer", "Dragon Breath"])
    # return potion
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

#Start of the adventure
puts "#{$character_name} can you hear me....." + "wispers".italic + " my name is #{$book_reader.yellow}, I am here to help you on your adventure...lets head to the edge of town to start our journey."
puts "You have arrived..."
puts "In front of you is a dark forest, everyone that has entered has never been seen again"
puts "You need to decide which direction you want to take? "

# Method for First Choice
$prompt = TTY::Prompt.new

def choice1
choice1 = $prompt.select("What path do you want to take?", %w(Left Right))
end

choice1 = data_character[0]

print choice1






















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
return #Terminates the Game
else

#Adding keys to the locks with time delay sleep() function=========================================================
puts "Well done #{$character_name} you have unlocked the secret passage to the Dragons Lair by guessing".green + " #{user_guess} #{$fire_emoji}".yellow, + " prepare yourself.....".green
puts "\n"
puts "Please take your #{$key_emoji}"
end
puts "\n"
puts "\n"
bar = TTY::ProgressBar.new("Intert your first key #{$key_emoji}".colorize(:green), total: 1) # Added TTY Progress bar showing quiz is downloading for UX
1.times do
  sleep(0.1)
  bar.advance  # by default increases by 1
end
sleep(1)
bar = TTY::ProgressBar.new("Intert your second key #{$key_emoji}".colorize(:green), total: 1) # Added TTY Progress bar showing quiz is downloading for UX
1.times do
  sleep(0.1)
  bar.advance  # by default increases by 1
end
sleep(1)
bar = TTY::ProgressBar.new("Intert your third key #{$key_emoji}".colorize(:green), total: 1) # Added TTY Progress bar showing quiz is downloading for UX
1.times do
  sleep(0.1)
  bar.advance  # by default increases by 1
end
sleep(1)
puts "\n"


#====================inserting keys end=====================================

puts "\n"
bar = TTY::ProgressBar.new("Unlocking Secret Door [:bar]".colorize(:blue), total: 35) # Added TTY Progress bar showing quiz is downloading for UX
45.times do
  sleep(0.1)
  bar.advance  # by default increases by 1
end
puts "\n"
puts "The door is open says #{$book_reader.yellow}"
puts "No one has ever got this far and survived......"
puts "You walk in, and are dazzled by the moutains of #{$treasure_emoji}" 
sleep(2)
puts "\n"
puts ""