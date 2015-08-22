##
# Mixin for debugging purposes
module Debug
  def whoami
    "Objecto de clase #{self.class.name} con id #{object_id}"
  end
end

##
# A dog
class Dog
  include Debug
  attr_accessor :name, :breed

  def initialize(name, breed)
    @name = name
    @breed = breed
  end

  def bark
    puts 'Woof!'
  end

  def bury(things, &block)
    things.each do |thing, place|
      puts "Burying #{thing} in #{place}" if !block || block.call(thing)
    end
  end
end

ani = Dog.new('Ani', 'Poodle')
ani.bark
ani.bury(hueso: 'patio', juguete: 'living', pantufla: 'cocina') do |thing|
  thing.to_s.start_with?('h')
end
puts ani.whoami
