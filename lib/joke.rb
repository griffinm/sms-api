# joke.rb
# Returns one of the top 10 jokes on reddit.com/r/jokes
class Joke
  require 'net/http'

  JOKE_URL = URI.parse('http://www.reddit.com/r/jokes.json')

  def self.command_name
    'joke'
  end

  def self.matcher
    /^joke$/
  end

  def self.response(params={})
    joke_json = get_joke_json
    joke = random_joke_node(joke_json)

    setup = joke['title']
    punch = joke['selftext']

    return "#{setup} #{punch}"
  end

  private

    def self.get_joke_json
      request = Net::HTTP::Get.new(JOKE_URL.to_s)
      response = Net::HTTP.start(JOKE_URL.host, JOKE_URL.port) {|http|
        http.request(request)
      }

      return JSON.parse(response.body)
    end

    def self.random_joke_node(joke_json)
      joke_number = rand(10)
      node = joke_json['data']['children'][joke_number]['data']
    end
end
