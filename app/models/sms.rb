class Sms < ActiveRecord::Base
  require 'twilio-ruby'

	validate :from_correct_number

  CORRECT_RECEIVED_FROM_NUMBER = '+16176520496'

  @twilio_client = client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']

  # process will parse a message and generates reply XML
  def reply
    reply_text = ""
    
    case self.body.downcase
    when 'shuttle'
      reply_text = Shuttle.get_eta
    when "commands"
      reply_text = "Commands:\nshuttle"
    else 
      reply_text = "Unknown command. Type \"commands\" for a list of commands"
    end

    twiml = Twilio::TwiML::Response.new do |r|
      r.Message reply_text
    end

    return twiml.text
  end

  private
    def from_correct_number
      errors.add(:from, 'Invalid number') unless CORRECT_RECEIVED_FROM_NUMBER == self.from
    end
end
