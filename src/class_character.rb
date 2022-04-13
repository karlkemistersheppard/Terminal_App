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