class Sms < ActiveRecord::Base 
	validate :from_correct_number

  # process will parse a message and generates reply XML
  def reply
    return SmsResponse.response(self.body)
  end

  private
    def from_correct_number
      unless AuthorizedNumber.where(phone_number: self.from).exists?
        errors.add(:from, 'Invalid number')
      end
    end
end
