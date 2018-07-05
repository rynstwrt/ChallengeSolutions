require "net/http"
require "json"

def get_distance x1, y1, x2, y2
    Math.sqrt (x2.to_f - x1.to_f) ** 2 + (y1.to_f - y2.to_f) ** 2
end

def get_closest_info str
    vert, horiz = str.split "\n"
    vert = vert.scan(/\d+\.\d+/)[0] * (vert.include?("N") ? 1 : -1)
    horiz = horiz.scan(/\d+\.\d+/)[0] * (horiz.include?("E") ? 1 : -1)

    resp = JSON.parse Net::HTTP.get URI "https://opensky-network.org/api/states/all"

    c_dist, c_icao24, c_callsign, c_country, c_long, c_lat, c_alt = nil

    resp["states"].each do |plane|
        next if plane[5].nil?
        dist = get_distance horiz, plane[5], vert, plane[6]
        if c_dist.nil? || c_dist >= dist
            c_dist = get_distance horiz, c_lat, vert, c_long
            c_icao24, c_callsign, c_country = plane[0..2]
            c_long, c_lat, c_alt = plane[5..7]
        end
    end
    [c_dist, c_icao24, c_callsign, c_country, c_long, c_lat, c_alt]
end
