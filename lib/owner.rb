class Owner
  # code goes here
  
  
  @@all = []
  
  def initialize(name)
    @name= name
    @species = "human"
    @@all << self
  end
  
  def name
    @name
  end
  
  def species
    @species = "human"
  end
  
  def say_species
    "I am a #{species}."
  end
  
  def self.all
    @@all
  end
  
  def self.count
    @@all.count
  end
  
  def self.reset_all
    @@all = []
  end
  
  def cats
    Cat.all.select{|cat|cat.owner == self}
  end
  
  def dogs
    Dog.all.select{|dog|dog.owner == self}
  end
  
  def buy_cat(name)
    Cat.new(name, self)
  end
  
  def buy_dog(name)
    Dog.new(name, self)
  end
  
  def walk_dogs
    Dog.all.collect do |dog|
      if(dog.owner == self)
        dog.mood = "happy"
      end
    end
  end
  
  def feed_cats
    Cat.all = Cat.all.collect do |cat|
      if(cat.owner == self)
        cat.mood = "happy"
      end
    end
  end
  
  def sell_pets
    
    cats_and_dogs = []
    cats_and_dogs = cats + dogs
    
    cats_and_dogs.collect do |a|
      if(a.owner == self)
        a.mood = "nervous"
        a.owner = nil
      end
    end
      
    #Cat.all.collect do |cat|
     # if(cat.owner == self)
      #  cat.mood = "nervous"
       # cat.owner = nil
    #  end
  #  end
    
  end
  
  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end
end