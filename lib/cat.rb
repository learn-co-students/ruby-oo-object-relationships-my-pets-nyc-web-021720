class Cat

    attr_reader :name
    attr_accessor :owner, :mood

    @@all = []

    def initialize(cat_name, owner)
      @name = cat_name
      @owner = owner
      @mood = "nervous"
      Cat.all << self
    end

    def self.all
      @@all
    end
end