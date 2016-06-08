# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# must be manually updated
poketotal = HTTParty.get("http://pokeapi.co/api/v2/pokemon/")
l = JSON.parse(poketotal.body)['results'].length

id = 1
until id > 9 do
  response = HTTParty.get("http://pokeapi.co/api/v2/pokemon/#{id}")
  h = JSON.parse(response.body)

  Pokemon.transaction do
      typeone = h['types'].find { |h1| h1['slot'] == 1 }['type']['name']
      typetwo = ''
      if h['types'].length > 1
        typetwo = h['types'].find { |h1| h1['slot'] == 2 }['type']['name']
      else
        typetwo = ''
      end
      pokemon = {
        name: response['name'],
        type1: typeone,
        type2: typetwo,
        hp: h['stats'].find { |h1| h1['stat']['name'] == 'hp' }['base_stat'],
        attack: h['stats'].find { |h1| h1['stat']['name'] == 'attack' }['base_stat'],
        defense: h['stats'].find { |h1| h1['stat']['name'] == 'defense' }['base_stat'],
        spatk: h['stats'].find { |h1| h1['stat']['name'] == 'special-attack' }['base_stat'],
        spdef: h['stats'].find { |h1| h1['stat']['name'] == 'special-defense' }['base_stat'],
        speed: h['stats'].find { |h1| h1['stat']['name'] == 'speed' }['base_stat'],
        pokedex_id: response['id'],
        image: response['sprites']['front_default']
      }
      puts pokemon

      if Pokemon.exists?(:name => pokemon[:name]) do
        puts 'its here, updating...'
        poke = Pokemon.find_by(name: pokemon[:name])
        poke.update!(pokemon)
      end
      else
        Pokemon.create!(pokemon)
      end
    end
  id += 1
end
