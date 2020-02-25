require 'pry'
class Owner
  attr_reader :name, :species, :mood 
  @@all = []
  def initialize(name)
    @name = name
    @species = "human"  
    Owner.all << self 
  end 

  def say_species 
    "I am a #{@species}."
  end 

  def self.all 
    @@all 
  end 

  def self.count
    Owner.all.size  
  end 

  def self.reset_all
    Owner.all.clear
  end 

  def cats 
    Cat.all.select{|cat|cat.owner == self}
  end 

  def dogs 
    Dog.all.select{|dog|dog.owner == self}
  end 

  def buy_cat(name)
    Cat.new(name,self)
  end 

  def buy_dog(name)
    Dog.new(name,self)
  end 

  def walk_dogs 
    dogs.map{|dog|dog.mood = "happy"}
    #binding.pry 
  end 
  def feed_cats
    cats.map{|cat|cat.mood = "happy"}
  end 

  def sell_pets 
    cats.map{|cat|cat.mood = "nervous"}
    dogs.map{|dog|dog.mood = "nervous"}
    cats.map{|cat|cat.owner = nil}
    dogs.map{|dog|dog.owner = nil}
  end 

  def list_pets 
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end 






end