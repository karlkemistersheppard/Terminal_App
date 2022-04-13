#class_potions()


class Potion

    def initialize(name, description)
        @name = name
        @description = description
    end
    def to_s
        return "You have just drunk a potion called #{@name} which has given you the ability to #{@description}"
    end 
end