
def tty_prompt_instructions
    $prompt = TTY::Prompt.new

    def start_options
        $answer = $prompt.select("+ ", ["HOW TO PLAY","Exit"])
    end
    
    # Gender Select
    def select_gender
        $about = $prompt.select("How to play:
        1. Step one create your own character name
        2. Step two create your own character from the options provided Gender, Race, Tool & Potion
        3. Step three read the story and try to navigate your way to the exit
        4. 
        5.
        ",$about,["Exit",])
    end
    
    option =""
    while option != "Exit"
        option = start_options
        case option
        when "HOW TO PLAY"
            about = select_gender
        else
        puts "Exit"
        end
    end
    system "clear"
end

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
    $tool = $prompt.select("Select your characters gender #{$character_name}", choice)
end
def potion_selection
    require "tty-prompt"
    $prompt = TTY::Prompt.new
    choice = %w(Wolf-Blood Vital-Essence Oort-Brew Soul-Dealer Dragon-Breath)
    $potion = $prompt.select("Select your characters gender #{$character_name}", choice)
end
#END OF CHARACTER CREATION

def intro_story
    puts "#{$character_name} can you hear me....." + "wispers".italic + " my name is #{$book_reader.yellow}, I am here to help you on your adventure...lets head to the edge of town to start our journey."
    sleep(4)
    puts "Fearless #{$race} you have arrived at your first destination, you are standing In front of Blood Moons Forest and tonight the moon is alive #{$moon}" 
    puts "The trees are talking, and you try to forget about the myths you have heared......" 
    puts "#{$book_reader.yellow}" + " wispers anyone that has entered the forest has never been seen again".italic
    puts "\n"
    sleep(3)
    puts "Your now have to decide which direction you want to take? "
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
        require "tty-prompt"
        $prompt = TTY::Prompt.new
        choice = %w(yes no)
        $user_choice1_left = $prompt.select("Do you want to take the chance and cross the bridge #{$character_name}", choice)
        system "clear"
    end
end


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

#RIVER CROSS QUESTION- not working
def river_cross
    if $user_choice1 == "right" || $user_choice1_left == "no"
        puts "You walk across the field until you reach a river"
        require "tty-prompt"
        $prompt = TTY::Prompt.new
        choice = %w(yes no)
        $user_choice_river = $prompt.select("Do you wish to cross the river #{$character_name}", choice)
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

#UNLOCKING SECRET DOOR
def unlock_secret_door
    bar = TTY::ProgressBar.new("Unlocking Secret Door [:bar]".colorize(:blue), total: 35) # Added TTY Progress bar showing quiz is downloading for UX
        45.times do
        sleep(0.1)
        bar.advance  # by default increases by 1
    end
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

#TTY-PROMPT UNLOCKING KEYS + AUDIO FILES END








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
            puts "You attempt to use the #{$tool} on the dragon but before you can do anyhting it swips you off your feet and burns you with its firey breath..... #{$death_emoji}(Restart Game)"
            # system "clear"
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
            require "tty-prompt"
            $prompt = TTY::Prompt.new
            choice = %w(yes no)
            $second_chance = $prompt.select("Do you wish ask for forgivness from the dragon and offer your service #{$character_name}", choice)
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
            # system("killall afplay")
            begin
                exit!
              rescue SystemExit
                p 123
              end
            return
        elsif $second_chance == "no"
                puts "The dragon swoops in and eats you #{$death_emoji}(Restart Game)"
                # system "clear"
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
                # system "clear"
                puts $thank_you
                Process.kill("SIGKILL", $process_id)
                # system("killall afplay")
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
                # system "clear"
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
            puts "You have it the wall, and cant move....."
            puts "Wish your last breath you...."
            sleep(3)
            puts "The dragon ate you"
            # system "clear"
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
                # system("killall afplay")
                begin
                    exit!
                  rescue SystemExit
                    p 123
                  end
                return
        
        elsif $user_choice_attack == "yes" && $potion == "Dragon-Breath"
                puts "You attempt to use the .... you died#{$death_emoji}(Restart Game)"
                # system "clear"
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
                # system "clear"
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
