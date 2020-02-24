class Owner
  attr_reader :name, :species

  @@all = []

  def initialize(owner_name)
    @name = owner_name    
    @species = "human"
    Owner.all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end

  # boo!
  def sell_pets
    [dogs, cats].flatten.each do |pet|
      pet.owner = nil
      pet.mood = "nervous"
    end
  end

  #cats

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def buy_cat(cat_name)
    Cat.new(cat_name, self)
  end

  def feed_cats
    cats.each{|cat| cat.mood = "happy"}
  end

  #dogs

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end

  def walk_dogs
    dogs.each{|dog| dog.mood = "happy"}
  end

  # class methods

  def self.all
    @@all
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    @@all = []
  end
end