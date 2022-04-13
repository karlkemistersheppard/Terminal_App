require_relative("./$global_unicodes")
require_relative("./$global_var.rb")
require_relative("./class_character.rb")
require_relative("./class_gender.rb")
require_relative("./class_tools.rb")
require_relative("./class_potion.rb")


def data
    #Characters Objects
    witcher = Character.new("witcher","strength", "1200")
    human = Character.new("human","vision", "500")
    blood_elvf = Character.new("blood_elf","extra life", "600")
    night_crawler = Character.new("night crawler","invisability", "400")
    warthog = Character.new("worthog","power slam", "300")
    soul_reaper = Character.new("soul reaper","soul harvesting", "400")
    spartan = Character.new("spartan","speed", "100")
    iron_dwarf = Character.new("iron dwarf","deflective shield", "300")
    kree_warrior = Character.new("kree warrior","strength", "200")

    #Gender Objects
    male = Gender.new("male")
    female = Gender.new("female")

    #Tool Objects

    infinity_gauntlet = Tools.new("Infinity Gauntlet","2000","2000")
    darkhold_blade = Tools.new("Dark Hold","1100","400")
    mjolnir = Tools.new("Mjolnir","900","40")
    gold_fist = Tools.new("Gold Fist","300","90")
    liquid_sword = Tools.new("Liquid Sword","200","50")
    no_tools = Tools.new("Rock","10","30")


    #Potion(name, description) "You have just drunk a potion called #{@name} which has given you the ability to #{@damage}"

    wolf_blood = Potion.new("wolf blood","survive 1000 cuts from the dragon")
    vital_essence = Potion.new("vital essence","take less damage from the dragon")
    oort_brew = Potion.new("oort brew","teleport once")
    soul_dealer = Potion.new("soul dealer","take a life from a soul near by")
    fire_breath = Potion.new("fire breather","breath fire")

end

