require "rails_helper"

describe Sms, type: :model do

  it 'will be valid when from the valid number' do
    sms = Sms.new(from: Sms::CORRECT_RECEIVED_FROM_NUMBER)

    expect(sms.valid?).to be true
  end

  it 'will not be valid when from a different number' do
    sms = Sms.new(from: '1115551234')

    expect(sms.valid?).to be false
  end

end