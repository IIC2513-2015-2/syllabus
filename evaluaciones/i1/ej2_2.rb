# NR = No requerido en la respuesta, pero incluido en la pauta por ser buena práctica

# NR: para que pueda ejecutarse el código
class IDontHaveThatPowerException < StandardError; end

class Person
  attr_reader :name, :last_name, :age, :gender

  def initialize(name, last_name, age, gender)
    @name = name
    @last_name = last_name
    @age = age
    @gender = gender
  end
end

class Hero < Person
  attr_reader :powers, :hero_name

  def initialize(name, last_name, age, gender, hero_name)
    super(name, last_name, age, gender)
    @hero_name = hero_name
    @powers = []
  end

  def add_power(power)
    # NR: to_sym es sólo por si el poder se entrega como string
    # NR: no es necesaria la verificación de que el poder ya exista
    @powers << power.to_sym unless @powers.include?(power.to_sym)
  end

  def use_power(power)
    # NR: to_sym sólo para soportar recibir poderes como string también
    raise IDontHaveThatPowerException unless @powers.include?(power.to_sym)
    puts "#{@hero_name}: Using #{power}! It's super effective!"
  end

  def +(other_hero)
    hero = Hero.new(@name, @last_name, @age, @gender, (@hero_name + other_hero.hero_name))
    all_powers = other_hero.powers + @powers
    all_powers.each { |e| hero.add_power(e) }
    hero
  end
end

# Código para testear lo anterior:
p1 = Person.new "Pedro", "Aste", 24, "M"
h1 = Hero.new "Pedro", "Aste", 24, "M", "Wachunei"
h2 = Hero.new "Juan", "Pérez", 24, "M", "SuperGeneric"

h1.add_power :dormir
h1.use_power :dormir

h2.add_power :ser_generico
h2.use_power :ser_generico

h3 = h1+h2

h3.use_power :dormir
puts "Poderes de h1: #{h1.powers}"
h1.use_power :hacer_pauta # lanza error
