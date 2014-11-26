class Sms < ActiveRecord::Base
  require 'twilio-ruby'

	validate :from_correct_number

  CORRECT_RECEIVED_FROM_NUMBER = '+16176520496'
  SEND_FROM_NUMBER = '+16178602742'

  @twilio_client = client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']

  # process will parse a message and generates reply XML
  def reply
    twiml = Twilio::TwiML::Response.new do |r|
      r.Message "App is up and running. Type \"help\" for a list of commands"
    end

    return twiml.text
  end

  private
    def from_correct_number
      errors.add(:from, 'Invalid number') unless CORRECT_RECEIVED_FROM_NUMBER == self.from
    end
end
