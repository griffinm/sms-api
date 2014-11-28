require 'twilio-ruby'

class SmsResponse
  
  @twilio_client = client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']

  MODULES = [
    Dinner,
    Joke,
    Coin,
    Shuttle,
    Weather,
    Commands
  ]

  def self.response(message_body)
    twiml = Twilio::TwiML::Response.new do |r|
      r.Message self.response_text(message_body)
    end

    return twiml.text
  end

  def self.response_text(message_text)
    message_text.downcase!

    MODULES.each do |responder|
      unless responder.matcher.match(message_text).nil?
        return responder.response({message: message_text})
      end
    end

    # no matches found, return the help message
    return "Command not found. " + Commands.response
  end

  # Generates a list of commands
  def self.command_array
    commands = Array.new

    MODULES.each do |responder|
      commands.push responder.command_name
    end

    return commands.sort
  end

end
