class Location
    attr_reader :longitude, :latitute

    def ==(other)
        longitude==other.longitude && latitute==other.latitute
    end
end