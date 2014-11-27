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

  def self.choose
    @options[rand(@options.length)]
  end

end
