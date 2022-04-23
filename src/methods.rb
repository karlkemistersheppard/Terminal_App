#TTY-PROMOPT HOW TO PLAY @ GAME START
def tty_prompt_instructions
    $prompt = TTY::Prompt.new

    #START OPTION PROMPT
    def start_options
        $answer = $prompt.select("+ ", ["HOW TO PLAY","Exit"])
    end
    #END

    #HOW TO PLAY INSTRUCTIONS
    def how_to_play
        $about = $prompt.select("\n""How to play:

        1. Step one you already made it here

        2. Set two create your own custom name you would like to use for your character " + "BE CREATIVE".green + "
        
        3. Step three create your own character from the options provided
        
        4. Step four adjust your sound
        
        5. Step five read the story and try to navigate your way to the exit without dying
        
        6. Step six if you fail, try again until you reach the end game 
        
        7. Have fun along the way... I hope you enjoy the adventure as much as i did creating it
        
        8. Now go find that
        ",$about,["Exit",])
    end
    #END

    option =""
    while option != "Exit"
        option = start_options
        case option
        when "HOW TO PLAY"
            about = how_to_play
        else
        puts "Exit"
        end
    end
    system "clear"
end
#END


#CREATE CHARACTER NAME
def create_character_name
    puts "So I can tell your fellow citizens about your adventure, please enter a unique character name." + " Be Creative".green
    $character_name = ""
    while true
        puts "Please enter your characters name?"
        $character_name = STDIN.gets.chomp.magenta
        $character_name.empty? ? (puts "Character name required") : break
    end
end
#END


#CHARACTER CREATION MENUS
def gender_selction
    require "tty-prompt"
    $prompt = TTY::Prompt.new
    choice = %w(Male Female)
    $gender = $prompt.select("Select your characters gender #{$character_name}", choice)
end
def race_selection
    require "tty-prompt"
    $prompt = TTY::Prompt.new
    choice = %w(Witcher Orc Human Blood-Elvf Night-Crawler Goblin Warthog Soul-Reaper Spartan Iron-Dwarf Kree-Warrior )
    $race = $prompt.select("Select your characters race #{$character_name}", choice)
end
def tool_selection
    require "tty-prompt"
    $prompt = TTY::Prompt.new
    choice = %w(Infinity-Gauntlet Darkhold-Blade Mjolnir Gold-Fist Liquid-Sword Nothing)
    $tool = $prompt.select("Select your characters weapon #{$character_name}", choice)
end
def potion_selection
    require "tty-prompt"
    $prompt = TTY::Prompt.new
    choice = %w(Wolf-Blood Vital-Essence Oort-Brew Soul-Dealer Dragon-Breath)
    $potion = $prompt.select("Select your characters potion #{$character_name}", choice)
end
#END


#INTRO TO STORY
def intro_story
    puts "#{$character_name} can you hear me....." + "whispers".italic + " my name is #{$book_reader.yellow}, I am here to help you on your adventure...lets head to the edge of town to start our journey."
    sleep(4)
    puts "Fearless #{$race} you have arrived at your first destination, you are standing In front of Blood Moons Forest and tonight the moon is alive #{$moon}" 
    sleep(3)
    puts "The trees are talking, and you try to forget about the myths you have heard......"
    sleep(2)
    puts "\n"
    puts "#{$book_reader.yellow}" + " whispers anyone that has entered the forest has never been seen again".italic
    puts "\n"
    puts "\n"
    sleep(3)
    puts "You now have to decide which direction you want to take? "
end
#END

#USER CHOICE ONE DIRECTIONAL PATH TO START
def user_choice1
    if $user_choice1 == "left"
        puts "You take the left path"
    elsif $user_choice1 == "right"
        puts "You take the right path"
    end
end
#END


#BRIDGE CROSSING CHOICE
def user_choice_bridge
    if $user_choice1 == "left"
        puts "You walk for 1 day until you reach a cliff #{$mountain_cliff}"  
        puts "You look over to the other side of the canyon and notice a old bridge that leads to where you need to go, BUT the bridge looks like it might break..."
        require "tty-prompt"
        $prompt = TTY::Prompt.new
        choice = %w(yes no)
        $user_choice1_left = $prompt.select("Do you want to take the chance and cross the bridge #{$character_name}", choice)
        system "clear"
    end
end
#END

#BRIDGE CROSSING ANSWER YES- END OF GAME
def user_choice_bridge_answer
    if $user_choice1_left == "yes"
        puts "You step out onto the bridge, and the support rope breaks... and you have fallen to your death #{$death_emoji}" + "(Restart Game)".red
        sleep(4)
        system "clear"
        Process.kill("SIGKILL", $process_id)
        puts $try_again
        $process_id = spawn "afplay -v 0.2 fail_effect.mp3"
        begin
            exit!
          rescue SystemExit
            p 123
          end
        return
    elsif $user_choice1_left == "no"
        puts "You look around and notice a narrow path that leads to a cave near some large trees #{$tree}."
        puts "#{$character_name} you have finally made your way through the cave and walk out into the light."  
        puts "Across the field you see a creepy tavern on the otherside of a rocky river"
    end  
end
#END


#RIVER CROSS QUESTION NO- DIRECTION TO RIVER
def river_cross
    if $user_choice1 == "right" || $user_choice1_left == "no"
        puts "You walk across the field until you reach a river"
        require "tty-prompt"
        $prompt = TTY::Prompt.new
        choice = %w(yes no)
        $user_choice_river = $prompt.select("Do you wish to cross the river #{$character_name}", choice)
    end
end
#END

#RIVER CROSSING ANSWER YES/NO
def river_cross_answer
    if $user_choice_river == "yes"
        puts "You cross the river and find a tavern on the otherside offering free beverages #{$beverage}"
        puts "The sun is vanishing over the mountains so you take up the offer and head inside"
        puts "You are greeted by an old lady that looks like a Witch but she offers you a glass of" 
        puts "\n"
        puts "1. Stale murky water #{$water}"
        puts "2. Dirty glass of wine #{$wine}"
        puts "\n"
        require "tty-prompt"
        $prompt = TTY::Prompt.new
        choice = %w(water wine)
        $user_choice_beverage = $prompt.select("You are thirsty, so you have to choose one... #{$character_name}", choice)
        system "clear"
    
    elsif $user_choice_river == "no"
        puts "You decide to not to cross, but didnt realise that you where poisoned by something in the forest.... your only option is to take the #{$potion} you have, but it poisons you resulting in your DEATH #{$death_emoji}(Restart Game)"
        sleep(4)
        system "clear"
        Process.kill("SIGKILL", $process_id)
        puts $try_again
        $process_id = spawn "afplay -v 0.2 fail_effect.mp3"
        begin
            exit!
          rescue SystemExit
            p 123
          end 
        return
    end
end
#END


#BEVERAGE CHOICE WATER/WINE
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
        system("killall afplay")
        system "clear"
        puts $try_again
        $process_id = spawn "afplay -v 0.2 fail_effect.mp3"
        begin
            exit!
          rescue SystemExit
            p 123
          end 
        return
    elsif $user_choice_beverage == "wine"
        puts "You take a seat and finish your wine #{$wine}"
        puts "But before you know it you have leave to continue on your adventure"
    end
    system "clear"
end
#END


#ENTERING CAVE WITH AUDIO STREAM- STORY MESSAGE
def cave_enter
    puts "After half a days walk you finally across splinters ridge and take the long walk up to scarecrow's mountain #{$mountain_cliff}"
    sleep(1)
    puts "Finally you arrive at the entrance to the Dragons Lair and begin to walk in"
    process_id = spawn "afplay -v 1 Walking_into_Dungeon.mp3"
    sleep(1)
    puts "As you start walking up to the cave you start to notice..."
    sleep(2)
    puts "The sound of the water droplets hitting the rock bed is echoing off the walls."
    sleep(1)
    puts "Its dark, its cold and the light is quickly becoming dark again"
    sleep(2)
    puts "As you step further into the cave you notice a large door with small key-shaped carvings....."
    sleep(2)
    puts "As you step closer, you notice the floor is damp and has a strange smell"
    sleep(2)
    puts "The door is beginning to open, you walk inside a and find yourself in a large room"
    sleep(3)
    puts "You chest is pumping with fear #{$fear}"
    sleep(4)
    puts "You walk through and the door closes behind you and locks."
end
#END

#RIDDLES 1,2,3
def riddles
    #RIDDLE ONE
    correct_answer = "dragon"
    user_guess = ""
    current_count = 0
    count_limit = 3
    out_of_guesses = false

    puts "You wish to enter my Lair......."
    sleep(2)
    puts "\n"
    puts "Well then" + " #{$character_name}" + " lets play a game if you dare!!!"
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
        system "clear"
        Process.kill("SIGKILL", $process_id)
        puts $try_again
        $process_id = spawn "afplay -v 0.2 fail_effect.mp3"
        begin
            exit!
        rescue SystemExit
            p 123
        end 
        return
    elsif
        puts "Well done" + " #{$character_name}" + " you have passed the first Riddle by guessing the correct answer".green + " #{user_guess} #{$dragon}".yellow
        puts "Please take your #{$key_emoji}"
        sleep(3)
    end


    #RIDDLE TWO
    correct_answer = "echo"
    user_guess = ""
    current_count = 0
    count_limit = 3
    out_of_guesses = false

    puts "So you passed my first test, it won't happen again..."
    puts "\n"
    sleep(3)
    puts "Riddle 2".yellow
    puts "\n"
    puts "I repeat every word you say, but I don't have a mouth"
    puts "You can hear me speak, but I cannot hear myself"
    puts "I exist, but you can't see me"
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
        Process.kill("SIGKILL", $process_id)
        puts $try_again
        $process_id = spawn "afplay -v 0.2 fail_effect.mp3" 
        begin
            exit!
        rescue SystemExit
            p 123
        end
        return
    else 
        puts "Well done" + " #{$character_name}" + " you have passed the second Riddle by guessing the correct answer ".green + " #{user_guess} #{$echo}".yellow
        puts "Please take your #{$key_emoji}"
        sleep(3)
    end



    #RIDDLE THREE
    correct_answer = "fire"
    user_guess = ""
    current_count = 0
    count_limit = 3
    out_of_guesses = false

    puts "You got lucky that time, you will never guess the last question as soo many have tried and failed...".green
    puts "\n"
    sleep(3)
    system "clear"
    puts "Final Riddle".yellow
    puts "\n"
    puts "Let's play a game...."
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
        Process.kill("SIGKILL", $process_id)
        puts $try_again
        $process_id = spawn "afplay -v 0.2 fail_effect.mp3" 
        begin
            exit!
        rescue SystemExit
            p 123
        end
        return
    else
        #Adding keys to the locks with time delay sleep() function=========================================================
        puts "Well done #{$character_name} you have unlocked the secret passage to the Dragons Lair by guessing".green + " #{user_guess} #{$fire_emoji}".yellow
        puts "\n"
        puts "Please take your keys and insert them into the key holes on the wall"
    end
    end

    #TTY-PROMPT UNLOCKING KEYS + AUDIO FILES- reference index.rb

    # #UNLOCKING SECRET DOOR- reference index.rb
    def door_opening
        puts "\n"
        sleep(1)
        puts "The door is open says #{$book_reader.yellow}"
        sleep(1)
        puts "No one has ever got this far and survived......"
        puts "You walk in, and are dazzled by the mountain of treasure and notice something moving in the shadows....." 
        sleep(3)
        puts "\n"
    end


    def dragon_encounter
        puts "ITS A DRAGON..."
        require "tty-prompt"
        $prompt = TTY::Prompt.new
        choice = %w(left right)
        $user_choice_dragon = $prompt.select("You have a choice... you can either run to the left or the right... #{$character_name}", choice)
        system "clear"
        if $user_choice_dragon == "left"
            puts "You have decided to run to the left"
        elsif $user_choice_dragon == "right"
            puts "You have decided to run to the right"
        end
end
#END


#DRAGON RUN DIRECTION LEFT
def dragon_run_direction_left
    if $user_choice_dragon == "left"
        puts "You run to the left and slip on a pile of bones...."
        puts "You hear the dragons wings flap and you freeze"
        puts "Before you realise the dragon is standing in front of you"
        require "tty-prompt"
        $prompt = TTY::Prompt.new
        choice = %w(yes no)
        $user_choice_attack = $prompt.select("Do you pull use the #{$tool} and attack the dragon? #{$character_name}", choice)
        
    
        if $user_choice_attack == "yes" && $potion != "Dragon-Breath"
            puts "You attempt to use the #{$tool} on the dragon but before you can do anything it swipes you off your feet and burns you with its firey breath..... #{$death_emoji}(Restart Game)"
            Process.kill("SIGKILL", $process_id)
            puts $try_again
            $process_id = spawn "afplay -v 0.2 fail_effect.mp3"
            begin
                exit!
              rescue SystemExit
                p 123
              end 
            return
        #Second Chance Life BASED on Potion Selection..
        elsif $user_choice_attack == "yes" && $potion == "Dragon-Breath"
            puts "You attempt to use the #{$tool} on the dragon but before you can do anything it blasts you with a fire ball..... #{$death_emoji}"
            sleep(2)
            puts "But wait...."
            sleep(1)
            puts "You have survived the first blast"
            puts "The dragon steps back and is confused ........"
            sleep(3)
            puts "You can't believe your luck.... you are still alive"
            sleep(1)
            puts "How..... am i alive"
            puts "You realise that you have survived the first blast from the dragon due to the #{$potion} potion you selected at the beginning of your journey"
            puts "You now have to decide your fate as you realise that the potion is used its life."
            require "tty-prompt"
            $prompt = TTY::Prompt.new
            choice = %w(yes no)
            $second_chance = $prompt.select("Do you wish ask for forgiveness from the dragon and offer your service #{$character_name}", choice)
        end
    end   
        
        if $second_chance == "yes"
            puts "You bend the knee and drop the #{$tool}"
            $process_id = spawn "afplay -v 0.2 item_drop.mp3"
            puts "and ask for forgivness from the dragon"
            puts "The dragon excepts your offer and allows you to live"
            puts "\n""\n""\n"
            sleep(3)
            puts $thank_you
            Process.kill("SIGKILL", $process_id)
            begin
                exit!
              rescue SystemExit
                p 123
              end
            return
        elsif $second_chance == "no"
                puts "The dragon swoops in and eats you #{$death_emoji}(Restart Game)"
                Process.kill("SIGKILL", $process_id)
                puts $try_again
                $process_id = spawn "afplay -v 0.2 fail_effect.mp3"
                begin
                    exit!
                  rescue SystemExit
                    p 123
                  end 
                return
    
        elsif  $user_choice_attack == "no" && $potion == "Dragon-Breath"
                puts "You drop the #{$tool} on the floor and tell the dragon you are there to offer your protection"
                puts "The dragon sits back and agrees to the offer, and allows you safe passage in and out of the lair"
                sleep(3)
                puts $thank_you
                Process.kill("SIGKILL", $process_id)
                begin
                    exit!
                  rescue SystemExit
                    p 123
                  end
                return
            elsif  $user_choice_attack == "no" && $potion != "Dragon-Breath"
                puts "You drop the #{$tool} on the floor and tell the dragon you are there to offer your protection"
                puts "You then realise that you choose the wrong potion and the dragon thinks you taste great"
                puts "You dont want to see what happens next............"
                sleep(3)
                Process.kill("SIGKILL", $process_id)
                puts $try_again
                $process_id = spawn "afplay -v 0.2 fail_effect.mp3"
                begin
                    exit!
                  rescue SystemExit
                    p 123
                  end
                return
    end
end
#END


#DRAGON RUN DIRECTION RIGHT
def dragon_run_direction_right
    if $user_choice_dragon == "right"
        puts "You run to the right and hide behind a large gold statue...."
        sleep(3)
        puts "You hear the dragons wings flap and you freeze"
        sleep(2)
        puts "Before you realise the dragon is standing in front of you waiting for your next move"
        sleep(3)
        require "tty-prompt"
        $prompt = TTY::Prompt.new
        choice = %w(yes no)
        $user_choice_attack = $prompt.select("Do you use the #{$tool} and attack the dragon #{$character_name}", choice)
    
        if $user_choice_attack == "no" && $potion != "Dragon-Breath"
            puts "You decide to drink the #{$potion} and you start to feel strange..."
            sleep(2)
            puts "Something is wrong.."
            puts "The dragon begins to circle you"
            puts "Before you can decide on your next move, the dragon swings its large tail and knocks you across the room"
            puts "You have hit the wall, and cant move your legs....."
            puts "Wish your last breath you...."
            sleep(3)
            puts "The dragon ate you"
            Process.kill("SIGKILL", $process_id)
            puts $try_again
            $process_id = spawn "afplay -v 0.2 fail_effect.mp3"
            begin
                exit!
              rescue SystemExit
                p 123
              end 
            return
        
        elsif  $user_choice_attack == "no" && $potion == "Dragon-Breath"
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
                begin
                    exit!
                  rescue SystemExit
                    p 123
                  end
                return
        
        elsif $user_choice_attack == "yes" && $potion == "Dragon-Breath"
                puts "You attempt to use the .... you died#{$death_emoji}(Restart Game)"
                Process.kill("SIGKILL", $process_id)
                puts $try_again
                $process_id = spawn "afplay -v 0.2 fail_effect.mp3"
                begin
                    exit!
                  rescue SystemExit
                    p 123
                  end 
                return

        elsif $user_choice_attack == "yes" && $potion != "Dragon-Breath"
                puts "You attempt to use the #{$potion} but before you can drink it the dragon eats you"
                Process.kill("SIGKILL", $process_id)
                puts $try_again
                $process_id = spawn "afplay -v 0.2 fail_effect.mp3"
                begin
                    exit!
                  rescue SystemExit
                    p 123
                  end 
                return
        end
    end
end

