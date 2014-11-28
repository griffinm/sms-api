class Weather
  require 'net/http'

  API_KEY = ENV['FORECAST_API_KEY']

  # Cambridge, MA
  DEFAULT_LAT = 42.38
  DEFAULT_LON = -71.13

  FORECAST_URL = URI.parse("https://api.forecast.io/forecast/#{API_KEY}/#{DEFAULT_LAT},#{DEFAULT_LON}")

  def self.command_name
    'weather'
  end

  def self.matcher
    /^(weather|forecast)$/
  end

  def self.response(params={})
    return formatted_forecast
  end

  private

    def self.get_forecast_response_json
      request = Net::HTTP::Get.new(FORECAST_URL.to_s)
      response = Net::HTTP.start(FORECAST_URL.host, FORECAST_URL.port, {use_ssl: true}) {|http|
        http.request(request)
      }
      
      return JSON.parse(response.body)
    end

    def self.get_current_temperate (forecast_json)
      return forecast_json['currently']['temperature']
    end

    def self.get_minutely_forecast (forecast_json)
      return forecast_json['minutely']['summary']
    end

    def self.get_hourly_forecasr (forecast_json)
      return forecast_json['hourly']['summary']
    end

    def self.formatted_forecast
      forecast_json = get_forecast_response_json
      current_temp = get_current_temperate(forecast_json)
      minutely = get_minutely_forecast(forecast_json)
      hourly = get_hourly_forecasr(forecast_json)

      return "#{current_temp}F and #{minutely} #{hourly}"
    end

end
