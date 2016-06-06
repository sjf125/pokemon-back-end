class Pokemon < ActiveRecord::Base
  has_many :types, inverse_of: :pokemon
  has_many :moves, inverse_of: :pokemon

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

  def self.index(total)
    response = HTTParty.get("http://pokeapi.co/api/v2/pokemon/?limit=#{total}")
    h = JSON.parse(response.body)
    i = 1
    page = 20
    until i == h['results'].length  do
       puts h['results'][i]['name']
       i += 1
    end
  end

  Pokemon.transaction do
    response.body.foreach(Rails.root + 'data/people.csv',
              headers: true) do |person_row|
        person = person_row.to_hash
        Person.create!(person) unless Person.exists?(person)
      end
    end
end
