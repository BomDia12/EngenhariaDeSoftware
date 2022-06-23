class Dessert
    def initialize(name, calories)
        @name = name
        @calories = calories
    end

    def healthy?
        @calories < 200
    end

    def delicious?
        true
    end

    attr_accessor :name, :calories
end


class JellyBean < Dessert
    def initialize(name, calories, flavor)
        @flavor = flavor
        super(name, calories)
    end

    def delicious?
        return false if flavor == 'black licorice'
        super
    end

    attr_accessor :flavor
end
