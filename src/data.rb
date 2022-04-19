require_relative("./$global_unicodes")
require_relative("./$global_var.rb")
require_relative"./class_character.rb"
require_relative("./class_gender.rb")
require_relative("./class_tools.rb")
require_relative("./class_potion.rb")

def start
    choice = []
    choice << 'Gender'
    choice << 'Race'
    choice << 'Tool'
    choice << 'Potion'
    choice << 'Exit'
end

def data_character
    character = []
    character << 'Warlock'
    character << 'Human'
    character << 'Blood Elvf'
    character << 'Night Crawler'
    character << 'WartHog'
    character << 'Soul Reaper'
    character << 'Spartan'
    character << 'Kree Warrior'
    
end

# #     #Characters Objects
def data_character
    witcher = Character.new("witcher","strength", "1200")
    human = Character.new("human","vision", "500")
    blood_elvf = Character.new("blood_elf","extra life", "600")
    night_crawler = Character.new("night crawler","invisability", "400")
    warthog = Character.new("worthog","power slam", "300")
    soul_reaper = Character.new("soul reaper","soul harvesting", "400")
    spartan = Character.new("spartan","speed", "100")
    iron_dwarf = Character.new("iron dwarf","deflective shield", "300")
    kree_warrior = Character.new("kree warrior","strength", "200")
    character = ["witcher", "human", "blood_elvf", "night_crawler", "warthog", "soul_reaper", "spartan", "iron_dwarf", "kree_warrior"]
    # return character
end
    
# # #Gender Objects
def data_gender    
    male = Gender.new("male")
    female = Gender.new("female")
    gender = ["male", "female"]
end
# #     #Tool Objects
def data_tools
    infinity_gauntlet = Tools.new("Infinity Gauntlet","2000","2000")
    darkhold_blade = Tools.new("Dark Hold","1100","400")
    mjolnir = Tools.new("Mjolnir","900","40")
    gold_fist = Tools.new("Gold Fist","300","90")
    liquid_sword = Tools.new("Liquid Sword","200","50")
    nothing = Tools.new("rock","10","30")
    tools = ["infinity_gauntlet","darkhold_blade", "mjolnir", "gold_fist", "liquid_sword", "nothing"]
end

#Potion(name, description) "You have just drunk a potion called #{@name} which has given you the ability to #{@damage}"
def data_potion
    wolf_blood = Potion.new("wolf blood","survive 1000 cuts from the dragon")
    vital_essence = Potion.new("vital essence","take less damage from the dragon")
    oort_brew = Potion.new("oort brew","teleport once")
    soul_dealer = Potion.new("soul dealer","take a life from a soul near by")
    fire_breath = Potion.new("fire breather","breath fire")
    potion = ["wolf_blood", "vital_essence", "oort_brew", "soul_dealer", "fire_breath"]
end


