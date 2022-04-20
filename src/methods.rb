def tty_prompt_start
    $prompt = TTY::Prompt.new

    def start_options
        $answer = $prompt.select("+ ", ["Gender","Race","Tool","Potions","Exit"])
    end
    
    # Gender Select
    def select_gender
        $gender = $prompt.select("Select your characters gender #{$gender_emoji}",$gender,["Male", "Female"])
    end
    
    #Character Select
    def select_character
        $race = $prompt.select("Select your race #{$character_emoji}",$character,["Witcher", "Human", "Blood Elvf", "Night Crawler", "Warthog", "Soul Reaper", "Spartan", "Iron Dwarf", "Kree Warrior"])
    end
    
    #Tool Select
    def select_tool
        $tool = $prompt.select("Select a Tool #{$sword_emoji}",$tools,["Infinity Gauntlet","Darkhold Blade", "Mjolnir", "Gold Fist", "Liquid Sword", "nothing"])
    end
    #Potion Select
    def select_potion
        $potion = $prompt.select("Select a potion #{$potion_emoji}",$potion,["Wolf Blood", "Vital Essence", "Oort Brew", "Soul Dealer", "Dragon Breath"])
    end
    
    system "clear"
    option =""
    while option != "Exit"
        option = start_options
        case option
        when "Gender"
            gender = select_gender
        when "Race"
            race = select_character
        when "Tool"
            tool = select_tool
        when "Potions"
            potion = select_potion
        else
        puts "Exit"
        end
    end
end

def user_choice1
    if $user_choice1 == "left"
        puts "You take the left path"
    elsif $user_choice1 == "right"
        puts "You take the right path"
    end
end

#BRIDGE CROSSING- not working
def user_choice_bridge
    if $user_choice1 == "left"
        puts "You walk for 1 day until you reach a cliff #{$mountain_cliff}."  
        puts "You look over to the otherside of the canyon and notice a old bridge that leads to where you need to go, BUT the bridge looks like it might break..."
        puts "Do you want to take the chance and cross the bridge?" + " (yes/no)".green
        $user_choice1_left = STDIN.gets.chomp
        system "clear"

        if $user_choice1_left == "yes"
            puts "You step out onto the bridge, and the support rope breaks... and you have fallen to your death #{$death_emoji}" + "(Restart Game)".red
            sleep(4)
            system "clear"
            puts $try_again
            # Process.kill("SIGKILL", $process_id)
            $process_id = spawn "afplay -v 0.2 fail_effect.mp3" 
            # system("killall afplay")
            return
        elsif $user_choice1_left == "no"
            puts "You look around and notice a narrow path that leads to a cave near some large trees #{$tree}."
            puts "#{$character_name} you have finally made your way through the cave and walk out into the light."  
            puts "Across the field you see a creepy tavern on the otherside of a rocky river"
        end
    end
end

#RIVER CROSS QUESTION- not working
def river_cross
    if $user_choice1 == "right" || $user_choice1_left == "no"
        puts "You walk across the field until you reach a river"
        puts "Do you wish to cross the river?" + " (yes/no)".green
        $user_choice_river = STDIN.gets.chomp
    end
end






def river_cross_answer
    if $user_choice_river == "yes"
        puts "You cross the river and find a tavern on the otherside offering free beverages #{$beverage}"
        puts "You take the offer and head inside"
        puts "You are greated by a old lady that looks like a Witch but she offers you a glass of" 
        puts "\n"
        puts "1. Stale murky water #{$water}"
        puts "2. Dirty glass of wine #{$wine}"
        puts "\n"
        puts "You are thirsty, so you have to choose one..." + " type (water/wine)".green
        $user_choice_beverage = STDIN.gets.chomp
        system "clear"
    
    elsif $user_choice_river == "no"
        puts "You decide to not to cross, but didnt realise that you where poisoned by something in the forest.... your only option is to take the #{$potion} you have, but it poisons you resulting in your DEATH #{$death_emoji}(Restart Game)"
        sleep(4)
        system "clear"
        Process.kill("SIGKILL", $process_id)
        puts $try_again
        $process_id = spawn "afplay -v 0.2 fail_effect.mp3" 
        # system("killall afplay")
        return
    end
end

#BEVERAGE CHOICE- not working

def beverage_choice
    if $user_choice_beverage == "water"
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
    
    
    elsif $user_choice_beverage == "wine"
        puts "You take a seat and finish your wine #{$wine}"
        puts "But before you know it you have leave to continue on your adventure"
    end
    
    system "clear"
end


#ENTERING CAVE WITH AUDIO STREAM
def cave_enter
    puts "After half a days walk you finally across slinters ridge and take the long walk up to scarecrow's mountain #{$mountain_cliff}"
    sleep(1)
    puts "Finally you arrive at the enterance to the Dragons Lair and begin to walk in"
    process_id = spawn "afplay -v 1 Walking_into_Dungeon.mp3"
    sleep(1)
    puts "As you start walking up to the cave you start to notice..."
    sleep(2)
    puts "The sound of the water droplets hitting the rockbed is echoing off the walls."
    sleep(1)
    puts "Its dark, its cold and the light is quickly becoming dark again"
    sleep(2)
    puts "As you step further into the cave you notice a large door with small key shaped carvings....."
    sleep(2)
    puts "As you step closer, you notice the floor is damp and has a strange smell"
    sleep(2)
    puts "The door is beginging to open, you walk inside a and find yourself in a large room"
    sleep(3)
    puts "You chest is pumping with fear #{$fear}"
    sleep(4)
    puts "You walk though and the door closes behind you and locks."
end
#ENTERING CAVE WITH AUDIO STREAM END

#RIDDLE GAME X3
def riddle_1
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
    else
        puts "Well done #{$character_name} you have passed the first Riddle by guessing the correct answer".green + " (#{user_guess})".yellow
        puts "Please take your #{$key_emoji}"
    end

end

def riddle_2
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

end

def riddle_3
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
    
end

#RIDDLE GAME X3 END



#TTY-PROMPT UNLOCKING KEYS + AUDIO FILES

def tty_progress_key_audio

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
end

def unlock_secret_door
    bar = TTY::ProgressBar.new("Unlocking Secret Door [:bar]".colorize(:blue), total: 35) # Added TTY Progress bar showing quiz is downloading for UX
        45.times do
        sleep(0.1)
        bar.advance  # by default increases by 1
    end
end

def dragon_encounter
    puts "ITS A DRAGON..."


    puts "You have a choice... you can either run to the left or the right...(type left or right)"
    $user_choice_dragon = STDIN.gets.chomp
    system "clear"
    if $user_choice_dragon == "left"
        puts "You have decided to run to the left"
    elsif $user_choice_dragon == "right"
        puts "You have decided to run to the right"
    end
end

#TTY-PROMPT UNLOCKING KEYS + AUDIO FILES END








#DRAGON RUN DIRECTION LEFT

def dragon_run_direction_left
    if $user_choice_dragon == "left"
        puts "You run to the left and slip on a pile of bones...."
        puts "You hear the dragons wings flap and you freeze"
        puts "Before you realise the dragon is standing in front of you"
        puts "Do you pull use the #{$tool} and attack the dragon? yes/no"
        $user_choice_attack = STDIN.gets.chomp
        
    
        if $user_choice_attack == "yes" && $potion != "Dragon Breath"
            puts "You attempt to use the #{$tool} on the dragon but before you can do anyhting it swips you off your feet and burns you with its firey breath..... #{$death_emoji}(Restart Game)"
            # system "clear"
            puts $try_again
            Process.kill("SIGKILL", $process_id)
            $process_id = spawn "afplay -v 0.2 fail_effect.mp3" 
            system("killall afplay")
            return
        #Second Chance Life BASED on Potion Selection..
        elsif $user_choice_attack == "yes" && $potion == "Dragon Breath"
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
            puts "You relise that you have survived the first blast from the dragon due to the #{$potion} potion you selected at the beginning of your journey"
            puts "You now have to decide your fate as you realise that the potion is used its life."
            puts "Do you wish ask for forgivness from the dragon and offer your service? yes/no" 
            $second_chance = STDIN.gets.chomp  
        end
    end   
        
        if $second_chance == "yes"
            puts "You bend the knee and drop the #{$tool}"
            $process_id = spawn "afplay -v 0.2 item_drop.mp3"
            puts "and ask for forgivness from the dragon"
            puts "The dragon excepts your offer and allows you to live"
            puts "\n""\n""\n"
            sleep(3)
            # system "clear"
            puts $thank_you
            Process.kill("SIGKILL", $process_id)
            $process_id = spawn "afplay -v 0.2 fail_effect.mp3" 
            system("killall afplay")
            return
        elsif $second_chance == "no"
            puts "The dragon swoops in and eats you #{$death_emoji}(Restart Game)"
            # system "clear"
            puts $try_again
            Process.kill("SIGKILL", $process_id)
            $process_id = spawn "afplay -v 0.2 fail_effect.mp3" 
            system("killall afplay")
            return
    
        elsif $user_choice_attack == "no"
            puts "You drop the #{$tool} on the floor and tell the dragon you are there to offer your protection"
            puts "The dragon sits back and agrees to the offer, and allows you safe passage in and out of the lair"
            sleep(3)
            # system "clear"
            puts $thank_you
            Process.kill("SIGKILL", $process_id)
            $process_id = spawn "afplay -v 0.2 fail_effect.mp3" 
            system("killall afplay")
            return
    end
end
#DRAGON RUN DIRECTION LEFT END


#DRAGON RUN DIRECTION RIGHT
def dragon_run_direction_right
    if $user_choice_dragon == "right"
        puts "You run to the right and hide behind a large gold statue...."
        sleep(3)
        puts "You hear the dragons wings flap and you freeze"
        sleep(2)
        puts "Before you realise the dragon is standing in front of you waiting for your next move"
        sleep(3)
        puts "Do you pull use the #{$tool} and attack the dragon? yes/no"
        $user_choice_attack = STDIN.gets.chomp
    
        if $user_choice_attack == "no" && $potion != "Dragon Breath"
            puts "You decide to drink the #{$potion} and you start to feel strange..."
            sleep(2)
            puts "Something is wrong.."
            puts "The dragon begins to circle you"
            puts "Before you can decide on your next move, the dragon swings its large tail and knocks you across the room"
            puts "You have it the wall, and cant move....."
            puts "Wish your last breath you...."
            sleep(3)
            puts "The dragon ate you"
            # system "clear"
            puts $try_again
            Process.kill("SIGKILL", $process_id)
            $process_id = spawn "afplay -v 0.2 fail_effect.mp3" 
            system("killall afplay")
            return
        
        elsif $user_choice_attack == "no" && $potion == "Dragon Breath"
            puts "You decide to drink the #{$potion} and you start to feel strange..."
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
        
            
        elsif $user_choice_attack == "yes" && $potion == "Dragon Breath"
                puts "You attempt to use the .... you died#{$death_emoji}(Restart Game)"
                # system "clear"
                puts $try_again
                # Process.kill("SIGKILL", $process_id)
                $process_id = spawn "afplay -v 0.2 fail_effect.mp3" 
                system("killall afplay")
                return
        elsif $user_choice_attack == "yes" && $potion != "Dragon Breath"
                puts "You attempt to use the #{$potion} but before you can drink it the dragon eats you"
                # system "clear"
                puts $try_again
                # Process.kill("SIGKILL", $process_id)
                $process_id = spawn "afplay -v 0.2 fail_effect.mp3" 
                system("killall afplay")
                return
                
    
        end
    end
end
