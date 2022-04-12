#class_race - Witcher, Human, Blood Elvf, Night Crawler, Warthog, Soul Reaper, Spartan, Iron Dwarf, Kree


class Character

    def initialize(race, special_ability, level)
        @race = race
        @special_ability = special_ability
        @level = level
    end
    def to_s
        return "#{@race} = #{@special_ability}: #{@level}"
    end 
end

witcher = Character.new("witcher","strength", "1200")
human = Character.new("human","vision", "500")
blood_elvf = Character.new("blood_elf","extra life", "600")
night_crawler = Character.new("night crawler","invisability", "400")
warthog = Character.new("worthog","power slam", "300")
soul_reaper = Character.new("soul reaper","soul harvesting", "400")
spartan = Character.new("spartan","speed", "100")
iron_dwarf = Character.new("iron dwarf","deflective shield", "300")
kree_warrior = Character.new("kree warrior","strength", "200")
    
puts witcher