class Owner
  attr_reader :name, :species

  @@all = []
  def initialize(name)
    @name = name
    # @species = "human"
    Owner.all << self
  end 

  def species
    @species = "human"
  end 

  def say_species
    "I am a #{species}."
  end 

  #class method that stores all instances of Owner
  def self.all
    @@all
  end 

  #class method that returns number of owners
  def self.count
    Owner.all.length
  end

  # reset owners that have been created
  def self.reset_all
    Owner.all.clear
  end 

  # pulls a list of cats that belong to this owner
  def cats
    Cat.all.select do |caterinos|
      caterinos.owner == self
    end 
  end 

  # pull a collection of dogs that belong to this owner
  def dogs
    Dog.all.select do |dogerinos|
      dogerinos.owner == self
    end 
  end 

  # buy cat creates a new instance of cat and assigns it to
  # current owner
  def buy_cat(cat_name)
    new_cat = Cat.new(cat_name, self)
  end 

  # buy dog creates a new instance of cat and assigns it to
  # current owner
  def buy_dog(dog_name)
    new_dog = Dog.new(dog_name, self)
  end 

  def walk_dogs
    # get list of dogs current owner owns by calling #{dogs} and
    # take them for a walk
    self.dogs.each do |dogwalk|
      dogwalk.mood = "happy"
    end 
  end 

  def feed_cats
    # get list of cats current owner owns by calling #{cats} and
    # give them some food, changing their mood to "happy"
    self.cats.each do |catfood|
      catfood.mood = "happy"
    end 
  end 

  def sell_pets
    # take list of {cats} and {dogs} and remove the owner and change
    # mood to 'nervous'
    self.dogs.each do |dogerino|
      dogerino.mood = "nervous"
      dogerino.owner = nil
    end 
    self.cats.each do |caterino|
      caterino.mood = "nervous"
      caterino.owner = nil
    end 
  end 

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end 
end