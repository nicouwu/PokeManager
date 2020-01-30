require 'poke-api-v2'
require 'pry'

PokeApi.get(pokemon: 'bulbasaur')

binding.pry