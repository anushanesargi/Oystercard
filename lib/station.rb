class Station

    ZONE_HASH = { 1 => ["a", "b", "c", "d"],
                2 => ["e", "f", "g", "h"],
                3 => ["i", "j", "k", "l"],
                4 => ["m", "n", "o", "p"],
                5 => ["q", "r", "s", "t"],
                6 => ["u", "v", "w"],
                7 => ["x", "y", "z"]
    }

    attr_reader :station_name, :zone_num

    def initialize(station_name)
        @station_name = station_name
        @zone_num = 0
    end

    def name
        @station_name
    end

    def zone
        ZONE_HASH.each do |key, val|
            @zone_num = key if val.include?(@station_name[0].downcase)
            break
        end
        return @zone_num
    end

end