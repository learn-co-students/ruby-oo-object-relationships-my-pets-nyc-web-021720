class Owner
  attr_reader :name, :species
  @@all = []
  def initialize(name)
    @name=name
    @species='human'
    @@all << self
  end

  def say_species
    return "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select{|c| c.owner == self}
  end

  def dogs
      Dog.all.select{|c| c.owner == self}
  end

  def buy_cat(name)
   cat= Cat.new(name, self) 
   cat
  end

  def buy_dog(name)
    dog=Dog.new(name, self) 
    dog
  end

  def walk_dogs
    dogs.map{|x| x.mood='happy'}
  end

  def feed_cats
    cats.map{|x| x.mood='happy'}
  end

  def sell_pets
    pets = dogs.concat(cats)
    pets.map{|x| x.mood = 'nervous'; x.owner= nil}
  end

  def list_pets
    return "I have #{dogs.length} dog(s), and #{cats.length} cat(s)."
  end
end