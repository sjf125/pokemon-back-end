class Pokemon < ActiveRecord::Base
  has_many :types, inverse_of: :pokemons
  has_many :moves, inverse_of: :pokemons

  def self.find(id)
    response = HTTParty.get("http://pokeapi.co/api/v2/pokemon/#{id}")
    h = JSON.parse(response.body)

    typeone = h['types'].find { |h1| h1['slot'] == 1 }['type']['name']
    typetwo = ''
    if h['types'].length > 1
      typetwo = h['types'].find { |h1| h1['slot'] == 2 }['type']['name']
    else
      typetwo = ''
    end

    {
      name: response['name'],
      type1: typeone,
      type2: typetwo,
      hp: h['stats'].find { |h1| h1['stat']['name'] == 'hp' }['base_stat'],
      attack: h['stats'].find { |h1| h1['stat']['name'] == 'attack' }['base_stat'],
      defense: h['stats'].find { |h1| h1['stat']['name'] == 'defense' }['base_stat'],
      spatk: h['stats'].find { |h1| h1['stat']['name'] == 'special-attack' }['base_stat'],
      spdef: h['stats'].find { |h1| h1['stat']['name'] == 'special-defense' }['base_stat'],
      speed: h['stats'].find { |h1| h1['stat']['name'] == 'speed' }['base_stat']
    }
  end

  def self.index
    response = HTTParty.get("http://pokeapi.co/api/v2/pokemon/")
    h = JSON.parse(response.body)
    i = 1
    until i == h['results'].length  do
       puts("Inside the loop i = #i")
       i += 1
    end
  end
end
