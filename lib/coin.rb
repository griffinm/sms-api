class Coin

  # Returns heads or tails at random
  def self.flip
    outcomes = ['heads', 'tails']
    return outcomes[rand(2)]
  end

end