

class Gender
    def initialize(gender)
        @gender = gender
    end
    def to_s
        return "#{@gender}"
    end

    def print_gender
        @gender.each do |gender|
            gender
        end
    end
end