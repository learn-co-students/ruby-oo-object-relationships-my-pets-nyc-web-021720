require "pry"
class Owner
  # code goes here
  attr_reader :name, :species

  @@all = []

  def initialize (name, species = "human")
    @name = name 
    @species = species
    Owner.all << self 
  end

  def say_species
    "I am a #{species}."
  end 

  def self.all
    @@all 
  end

  def self.count
    Owner.all.count
  end

  def self.reset_all
    Owner.all.clear 
  end

  def cats
    Cat.all.select do |cat_obj|
      cat_obj.owner == self
    end
  end

  def dogs
    Dog.all.select do |dog_obj|
      dog_obj.owner == self
    end
  end

  def buy_cat(cat)
  # binding.pry 
     a = Cat.new(cat,self)
  end

  def buy_dog(dog)
    b =Dog.new(dog,self)
  end

  def walk_dogs
    dogs.each do |dog_element|
      dog_element.mood = "happy"
    end
  end

  def feed_cats
    cats.each do |cat_element|
      cat_element.mood = "happy"
    end
  end

  def sell_pets 
    pets = cats + dogs
    pets.each do |pets|
      pets.mood = "nervous"
      pets.owner = nil
    end
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end
end