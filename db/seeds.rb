
if User.count == 0
	User.create(
		email: 'griffin.mahoney@gmail.com',
		password: 'password'
	)
end

if AuthorizedNumbers.count == 0
	AuthorizedNumber.create(
		phone_number: '+16176520496'
	)
end