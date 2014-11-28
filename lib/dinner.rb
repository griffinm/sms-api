class Dinner

  @options = [
    'Eggplant Parm',
    'Chicken Parm',
    'Indian!', 
    'Chicken Pot Pie',
    'Pizza!',
    'Beef Stew',
    'Chili',
    'Tortellini Soup',
    'Steak',
    'ChickPaVeg',
    'Meat Balls',
    'Chicken Crepes',
    'Fajitas',
    'Lasagna',
    'Baked Ziti',
    'Gnocchi',
    'Baked Chicken',
    'Chicken Broccoli Supreme',
    'Stir Fry',
    'Mac N Cheese',
    'Meat Loaf'
  ]

  def self.command_name
    'dinner'
  end

  def self.matcher
    /^dinner$/
  end

  def self.response(params={})
    @options[rand(@options.length)]
  end

end
