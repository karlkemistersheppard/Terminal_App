# T1A3_Terminal_App

### Source Control Repository
Below is a link to the first source control repository that was created prior to Slide Deck presentation.
From there, i created a second branch called modulairze and pushed all further updates to ensure that i had a backup copy of the working application prior to modulairzing the index.rb by transfering majority of the index code to defined methods.
### First Repo- prior to presentations (24 commits)
https://github.com/karlkemistersheppard/Terminal_App/tree/main
### Final Destination (42 commits +) 
Marking for the assesment to be done on this file. (Once marking is completed i will merge the branch into the main)
https://github.com/karlkemistersheppard/Terminal_App/tree/modulairze


### Code Styling

#### R5- Identify any code style guide or styling conventions that the application will adhere to.

Code styling for the Terminal Application is designed to be simplistic, clean and easy to read.
The general styling is based on each code block or method to be wrapped in a #HEADING and followed by a trailing #END to ensure whoever is reading the syntax can clearly identify when a method is called.

All code blocks are invoked from external .rb files either using $global variable/values or wrapped in def methods to ensure that the main index.rb file is kept as clean as possible.
The styling convention of the index.rb file is laid out from top to bottom following the same flow in the methods.rb file.  Each method is labelled with meaningful titles to ensure that it’s easy to read and follow.

There are a few code blocks that are exempt from this styling, specifically the tty-progress bar that even though it works without issues- when wrapped inside a def method causes the progress bar to prints a random value to the screen but displays no error.

Additional styling that was added later on in the development of the application was the conversion from standard STDIN.gets.chomp user input to TTY-Prompt to simplify the UX and Error Handling issues associated with incorrect user input.

##### Example 
Below is an example of how the index.rb file is styled.
As discussed above each method is called from the method.rb file and wrapped with a meaningful title then closed with a #END.
In addition to keeping it clean, I’ve used additional system "clear" syntax commands to clear the screen to ensure it’s easier for the user to read.
puts "\n" where also used throughout the methods and index.rb to space out the content for UX.

```ruby
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
```
##### Example 
Styling conventions transfer across to the method.rb file and additional files to ensure its consistant for the viewers.

```ruby
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
```

### Features
R6	Develop a list of features that will be included in the application. It must include:
  
### Feature 1 (Control Structures)
####Feature 1: 

The below code block is taken form one of the riddles that where implemented into the adventure game to test the users.
The control structure for this particular block consists of a large variety of:
##### While loops & if else statements

In the below feature, I used if and else conditions to check the condition using logical operators to determine if the program needs to iterate through the while loop until the count_limit reaches (3) or until the user_guess is == correct _answer.  Once the  user_guess is == to the correct_answer the while loop will exit the loop and move to the next if conditional statement executing the elsif condition and print “Well done” to the user.

```ruby
  while user_guess != correct_answer and !out_of_guesses 
        if current_count < count_limit 
        puts "Guess: "
        user_guess = STDIN.gets.chomp()
        current_count += 1

        else
        out_of_guesses = true
        end
    end
```
##### Variables

Variables were used to save strings, integers and boolean expressions ect:  false, 3, 0 “dragon”.
This was vital for the guessing game to function as without them the while loops, and if statements would not be able to compare the current user_guess or guess_count to decide if the user had passed or failed the riddle.

```ruby
correct_answer = "dragon"
    user_guess = ""
    current_count = 0
    count_limit = 3
    out_of_guesses = false
```
##### Boolean expressions

Great use of the boolean expression false is utilising it inside an if statement as below.  
If out of guesses is false do the below.  This helps direct the program to execute particular commands based on the outcome/value returned.

```ruby
if out_of_guesses
        puts "You are out of guesses, the floor just opened up and you fell to your death #{$death_emoji}"
        sleep(4)
        system "clear"
        Process.kill("SIGKILL", $process_id)
        puts $try_again
        $process_id = spawn "afplay -v 0.2 fail_effect.mp3"
        # system("killall afplay")
        begin
            exit!
        rescue SystemExit
            p 123
        end 
        return
```
##### Error Handling

Ive added the below into each endpoint in the users journey to ensure that the program exits/terminates after the TRY AGAIN prompt is displayed.
```ruby
        begin
            exit!
        rescue SystemExit
            p 123
        end 
        return
```
##### Logical operators

There was only one requirement for using logical operators in this code block and that was used ot check the two conditions ect while user_guess is not = correct_answer (and, &&) user is !not outs_of_guesses do this.
```ruby
    while user_guess != correct_answer and !out_of_guesses
        if current_count < count_limit
        puts "Guess: "
        user_guess = STDIN.gets.chomp()
        current_count += 1

        else
        out_of_guesses = true 
        end
    end
```

#### Feature 2 (Tty-Prompt)

I decided to incorporate the TTY-Prompt (ruby gem) into my program to reduce the risk of error handling occurring from the user incorrectly entering invalid options using a gets.chomp scenario or simply running exit and avoiding the creation in the beginning. 

Moving the tty-prompt to the individual methods allowed for more control from the development side as it handles the majority of the possible errors.
Below example of the main character selection

```ruby
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
```
##### String Interpolation

Demonstration of basic string interpolation as used inside the tty-prompt message to the user.
As the string variable was created external to the method, the variable was converted into a global variable for the function to work.  
```ruby
$potion = $prompt.select("Select your characters potion #{$character_name}", choice)
```
##### Variables

In the code block, I saved three separate variables two of which I converted to $global variables so I could use them in other areas of the program external to the method.
Using $global variables was an important style/structure for the development of this application, due to the complexity and range of paths the user can take to run the adventure.

```ruby
def potion_selection
    require "tty-prompt"
    $prompt = TTY::Prompt.new
    choice = %w(Wolf-Blood Vital-Essence Oort-Brew Soul-Dealer Dragon-Breath)
    $potion = $prompt.select("Select your characters potion #{$character_name}", choice)
end
```

##### Error Handling

Error handling for the TTY-Prompt is basically dealt with by the Development team that created and maintain the Gem.
It forces the user to select from a list of items presented on the display and in this case it provides no option to exit or bypass the prompt.select.

```ruby
def potion_selection
    require "tty-prompt"
    $prompt = TTY::Prompt.new
    choice = %w(Wolf-Blood Vital-Essence Oort-Brew Soul-Dealer Dragon-Breath)
    $potion = $prompt.select("Select your characters potion #{$character_name}", choice)
end
```
##### Logical operators

Below is a snippet from a code block method that utilizes the TTY-Prompt.select $global variable to check it against the $users_choice_attack to pass a new direction for the player.
This is a powerful way to hide secret second chance options based on conditions created at the beginning of the program, for example, if the user selects $potion = "Dragons-Breath" and the user attacks the dragon, they would normally die but if both conditions below are true then the user can access the second chance life/option.

```ruby
#Second Chance Life BASED on Potion Selection.. LINE 465 Methods.rb
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
```
##### Error Handling

Error handing has not required for this function as the user choices where pre defined in the tty-prompt selector.
```ruby
choice = %w(yes no)
```

#### Feature 3 (Variables and Variable Scope)

My main reason for choosing this feature was the complexity of using multiple variables both internal the existing method and calling $global methods that were assigned to three separate.rb files in the program.  This was a great way to showcase my skill and understanding of variables in a shortcode block.

##### Importing from TTY-Progressbar & Colorize Gem 

Gemfile- added the below to and to initiate the gem i have added it the to top of the index.rb file so i can function correctly
```ruby
gem "tty-progressbar", "~> 0.18.2"
```
Stardard gem syntax with the addition of string interpolation and colorize gem as added features to customise the progress bar where used in this instance.
```ruby
bar = TTY::ProgressBar.new("Preparing your Adventure #{$character_name} [:bar]".colorize(:blue), total: 45) # Added TTY Progress bar showing quiz is downloading for UX
45.times do
  sleep(0.1)
  bar.advance
end
```
##### Loops

TTY- Progress bar comes preloaded with a built-in loop that can be modified based on the multiplier count through which you want the progress bar to iterate through.
In this example, I have called the loop 45 times with a 0.1-second sleep() function to smoothen the transition between the loops.

```ruby
45.times do
  sleep(0.1)
  bar.advance
```
##### System Clear

Throughout the program I have utilized the system "clear", to clear the screen when the display information is no longer required so it assists with keeping the user’s viewport clean and uncluttered.

```ruby
system "clear"
```

##### Variables & Global Variables

The below function uses a mix of variables both local and global, but more importantly its using these variables from inside index.rb and calls them from other methods such as the TTY-Prompt character creation method.  This was an important function as I wanted to utilise string interpolation to make the puts statement meaningful to the user by printing what they had selected in the string.

An additional bonus feature was the inclusion of the emoji regex gem that allowed me to save unicode emojis in the $global_unicode.rb to variables and call them by assigning them via string interpolation at any given time.

```ruby
#INCLUDES CALLING $GLOBAL VARIABLES AND GEM UNICODE + TTY-PROMPT PROGRESS BAR GEM
puts "Congratulations #{$character_name}, you are the first #{$gender} #{$race} to embank on such a dangerous journey, you have decided to grab #{$tool} as your weapon to protect youself and have a vial of #{$potion} #{$potion_emoji}"
puts "\n"
bar = TTY::ProgressBar.new("Preparing your Adventure #{$character_name} [:bar]".colorize(:blue), total: 45)
45.times do
  sleep(0.1)
  bar.advance
end
sleep(3)
system "clear"
#END
```

#### Feature Bonus (afplay)

This is a feature that i found on [Source](https://ss64.com/osx/afplay.html) the documentation is extremely limited, but it connects to the Kernel System and begins the process without waiting for any processes to finish.  This is a great way to spawn audio files into a .rb file if you’re trying to draw the player into your world in this case, Dragons Lair.

The **function** is broken up into three stages.

Stage one is creating the link with the system.
This is the basic syntax for calling the function which saves the file into a global variable called $process_id.  
Once the process executes it spawns the afplay connection to initiate the audio feed => from here you can control the audio volume to the feed with -v 0.2 "This is adjustable from **0.01 - 255"** worth noting **-v 50** will cause potential damage to your speakers.
Once the -v control is set you can simply input the audio file name followed by the audio format and ensure you point it to the correct directory path.
```ruby
$process_id = spawn "afplay -v 0.2 It_Is_Coming_-_David_Fesliyan.mp3" 
```
Stage two is only needed if you wish to kill the function midstream,  this may be useful if you need the sound to be interrupted at any stage during the program.I used this process multiple times across the program when I needed to kill the process either when the game ended or the player failed.  One of the great features of using afplay is that you can overlap audio files such as what I’ve done within this program. 

I set It_Is_Coming_-_David_Fesliyan.mp3 to -v 0.2 to set the background noise whilst running  -v 1 Walking_into_Dungeon.mp3 over the background music.
```ruby
Process.kill("SIGKILL", $process_id)
```
The final stage is the system overriding Kill all “afplay” commands, this will terminate every sound command afplay is currently handling once it’s called.
This is used in some instances throughout the program and the end points to ensure the sound doesn’t continue to play passed the termination of the Terminal application as it’s not running the function in the Terminal but rather throughout the main system kernel.
```ruby
system("killall afplay")
```

### Development Planning

#### Trello Board
https://trello.com/b/oZLNoiP9/t1a3-terminal-app-kks

R7	
Develop an implementation plan which:
- outlines how each feature will be implemented and a checklist of tasks for each feature
- prioritise the implementation of different features, or checklist items within a feature
- provide a deadline, duration or other time indicator for each feature or checklist/checklist-item

#### Feature 1 (Estimated Time Allocation ? hrs)

##### Checklist

1. /
2. /
3. /
4. /
5. /
6. /
7. /
8. /
9. /
10. 

#### Feature 2 (Estimated Time Allocation ? hrs)

##### Checklist

1. /
2. /
3. /
4. /
5. /
6. /
7. /
8. /
9. /
10. 


#### Feature 3 (Estimated Time Allocation ? hrs)

##### Checklist

1. /
2. /
3. /
4. /
5. /
6. /
7. /
8. /
9. /
10. 




Provide screenshots/images and/or a reference to an accessible project management platform used to track this implementation plan. 

![alt text](./docs/Development%20Process%20Plan.png)
![alt text](./docs/Flow_Chart_Control.drawio.png)
![alt text](./docs/Screen%20Shot%202022-04-14%20at%207.20.27%20pm.png)
![alt text](./docs/Screen%20Shot%202022-04-16%20at%201.42.05%20am.png)
![alt text](./docs/Screen%20Shot%202022-04-21%20at%204.03.27%20pm.png)
![alt text](./docs/Screen%20Shot%202022-04-21%20at%209.30.14%20am.png)
![alt text](./docs/Screen%20Shot%202022-04-22%20at%2010.05.44%20pm.png)
![alt text](./docs/Screen%20Shot%202022-04-23%20at%2012.09.48%20am.png)

### Help Documentation









#### How to play

To initiate the game from the Termainal once you have followed the install process.
Navigate inside the src directory via the command line/ terminal and enter the below to run the game.
```code
./run_index.rb
```
You will be greated with the below option 
```code
1. Step one you already made it here
2. Set two create your own custom name you would like to use for your character " + "BE CREATIVE".green + "
3. Step three create your own character from the options provided
4. Step four adjust your sound
5. Step five read the story and try to navigate your way to the exit without dying
6. Step six if you fail, try again until you reach the end game         
7. Have fun along the way... I hope you enjoy the adventure as much as i did creating it
8. Now go find that
```
![alt text](./docs/1.%20start_screen.png)
![alt text](./docs/2.%20How_to_play.png)
![alt text](./docs/3.%20Landing_Logo.png)
![alt text](./docs/4.%20Gender_TTY.png)
![alt text](./docs/5.%20Race_TTY.png)
![alt text](./docs/6.%20Tool_TTY.png)
![alt text](./docs/7.%20Potion_TTY.png)
![alt text](./docs/8.%20Progress_Bar_Loading.png)
![alt text](./docs/9.%20Story_intro.png)
![alt text](./docs/10.%20TRY_AGAIN.png)













#### Instalation Instructions

R8	
Design help documentation which includes a set of instructions which accurately describe how to use and install the application.

You must include:
- steps to install the application
- any dependencies required by the application to operate
- any system/hardware requirements
- how to use any command line arguments made for the application



###















Reference:

Adding Audio to .rb [ONLINE] available at [https://gist.github.com/ihollander/61b194622b7a5389a581ed2a270d0641] viewed 15.04.2022.
Adding volume control to element .mp3 [ONLINE] available at [https://www.unix.com/os-x-apple-/267933-osx-afplay-command-line-audio-player-_manual_.html] viewed 17.04.2022.
Source [ONLINE] available at [https://www.fesliyanstudios.com/sound-effects-search.php?q=unlock+lock] viewed at 15.04.2022.
Source [ONLINE] available at [https://www.fesliyanstudios.com/royalty-free-music/download/it-is-coming/262] viewed at 15.04.2022.
Creating Text Image [ONLINE] available at [http://patorjk.com/software/taag/#p=testall&f=3D%20Diagonal&t=D%20R%20A%20G%20O%20N%20S%0A%20%20L%20A%20I%20R] viewed at 15.04.2022.
Source Art [ONLINE] Available at [https://asciiart.website/index.php?art=creatures/dragons] viewed 15.04.2022.
scary witch laugh https://quicksounds.com/sound/8839/scary-witch-cackle
Knife sound effect https://quicksounds.com/sound/17708/knife-fall-on-metal-ground-2
Fail sound effect https://quicksounds.com/sound/323/sad-trombone-wah-wah-wah-fail
Unsplash image used for SlideDeck [ONLINE] available at [https://unsplash.com/photos/zQMN9fLJehM?utm_source=unsplash&utm_medium=referral&utm_content=creditShareLink] viewed 18.04.2022.
How to force exit [ONLINE] available at [https://www.rubyguides.com/2019/03/ruby-exit/] viewed 20.04.2022