require "rails_helper"

valid_number = Sms::CORRECT_RECEIVED_FROM_NUMBER
sms_request = {
  :ToCountry => "US",
  :ToState => "MA",
  :SmsMessageSid => "SMd10c206958a864855b76deefc629a3b7",
  :NumMedia => "0",
  :ToCity => "BROOKLINE",
  :FromZip => "02421",
  :SmsSid => "SMd10c206958a864855b76deefc629a3b7",
  :FromState => "MA",
  :SmsStatus => "received",
  :FromCity => "ROXBURY",
  :Body => "Blah",
  :FromCountry => "US",
  :To => "+16178602742",
  :ToZip => "02445",
  :MessageSid => "SMd10c206958a864855b76deefc629a3b7",
  :AccountSid => "ACc42d3b74650a2e0ef5f3812fad3e03ca",
  :From => "+16176520496",
  :ApiVersion => "2010-04-01"
}

describe SmsController, type: :controller do
  describe 'POST #create' do

    it 'Creates a new record when from a valid number' do
      test_sid = 'some_sid'
      post :create, format: :json, SmsMessageSid: 'some_sid', From: valid_number

      new_record = Sms.last

      expect(new_record.sms_message_sid).to eq test_sid
    end

    it 'Does not create a new record from an invalid number' do
      invalid_number = '+11235551234'
      post :create, format: :json, SmsMessageSid: 'some_sid', From: invalid_number

      expect(Sms.count).to eq 0
    end

    it 'Responds to a health check method' do
      message_body = 'check'
      post :create, format: :json, From: valid_number, Body: message_body

      expect(response.body).to include 'App is up and running. Type "help" for a list of commands'
    end

  end
end