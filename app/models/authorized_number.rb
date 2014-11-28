class AuthorizedNumber < ActiveRecord::Base
	has_many :messages,
		class_name: 'Sms',
    foreign_key: :from,
    primary_key: :phone_number

  validates :phone_number,
    uniqueness: true,
    presence: true
end