class Shuttle
  require 'net/http'

  REQUEST_URI = URI.parse("http://alewifeconnect.com/Services/JSONPRelay.svc/GetMapStopEstimates")
  FAWCETT_STOP_ID = 17
  ALEWIFE_STOP_ID = 16
  ROUTE_ID = 2

  def self.command_name
    'shuttle'
  end

  def self.matcher
    /^shuttle$/
  end

  def self.response(params={})
    stop_json = get_stop_data

    if get_stop_data.count == 0
      return "Shuttle not on route"
    end

    alewife_eta_seconds = get_eta_for_stop_id(stop_json, ALEWIFE_STOP_ID)
    fawcett_eta_seconds = get_eta_for_stop_id(stop_json, FAWCETT_STOP_ID)

    alewife_string = arrival_time_string(alewife_eta_seconds)
    fawcett_string = arrival_time_string(fawcett_eta_seconds)

    return "Alewife - #{alewife_string}\nFawcett - #{fawcett_string}"
  end

  private

    def self.arrival_time_string(arrival_time_in_seconds)
      arrival_time = Time.zone.now + arrival_time_in_seconds.seconds
      arrival_time = arrival_time.strftime('%I:%M')
      eta_minutes = arrival_time_in_seconds / 60

      return "#{arrival_time} (#{eta_minutes} minutes)"
    end

    def self.get_stop_data
      request = Net::HTTP::Get.new(REQUEST_URI.to_s)
      response = Net::HTTP.start(REQUEST_URI.host, REQUEST_URI.port) {|http|
        http.request(request)
      }
      
      return JSON.parse(response.body)
    end

    def self.get_eta_for_stop_id(route_json, stop_id)
      node = find_stop_node(route_json, stop_id)
      eta_seconds = node["Estimates"][0]["SecondsToStop"]

      return eta_seconds
    end

    def self.find_stop_node(route_json, stop_id)
      route_json[0]["RouteStops"].each do |node|
        if node["RouteStopID"] == stop_id
          return node
        end
      end
    end

end
