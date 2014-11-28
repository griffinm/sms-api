class Coin

	def self.command_name
		'flip'
	end

	def self.matcher
		/^(flip|coin)$/
	end

  # Returns heads or tails at random
  def self.response(params={})
    outcomes = ['heads', 'tails']
    return outcomes[rand(2)]
  end

end
