class Dog

  attr_reader :name
  attr_accessor :owner, :mood

  @@all = []

  def initialize(dog_name, owner)
    @name = dog_name
    @owner = owner
    @mood = "nervous"
    Dog.all << self
  end

  def self.all
    @@all
  end
end