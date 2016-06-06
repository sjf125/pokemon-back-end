require 'httparty'

response = HTTParty.get('http://pokeapi.co/api/v2/pokemon/1/')
# puts response['stats'], response.code, response.message, response.headers.inspect
#

#
# response['types'].each do |stat|
#   puts stat['type']['name']
# end

j = response.body

# puts j

h = JSON.parse(j)

typeone = h['types'].find { |h1| h1['slot'] == 1 }['type']['name']
typetwo = h['types'].find { |h1| h1['slot'] == 2 }['type']['name']
puts response['name']
puts "Type 1: #{typeone}, Type 2: #{typetwo}"
response['stats'].each do |stat|
  puts stat['stat']['name']
  puts stat['base_stat']
end
