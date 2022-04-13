#class_tools(sword, hammer, staff, potions)


class Tools

    def initialize(tool_name, damage, durability_loss)
        @tool_name = tool_name
        @damage = damage
        @durability_loss = durability_loss
    end
    def to_s
        return "#{@tool_name} just did #{@damage} hit points to your enemys health, but your item has taken #{@durability_loss} durability loss"
    end 
end