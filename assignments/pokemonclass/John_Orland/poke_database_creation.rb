require_relative 'poke_database_connection'
require 'csv'
require_relative 'pokemon'

ActiveRecord::Schema.define do
  create_table :pokemons do |t|
    t.integer :poke_num
    t.string  :name
    t.string  :poke_type
    t.integer :hp
    t.integer :attack
    t.integer :defense
    t.integer :sp_atk
    t.integer :sp_def
    t.integer :speed
  end
end

CSV.foreach("151_pokemon.csv", headers: true) do |row|
  Pokemon.create({
    poke_num: row["poke_num"],
    name: row["name"],
    poke_type: row["type"],
    hp: row["hp"].to_i,
    attack: row["attack"].to_i,
    defense: row["defense"].to_i,
    sp_atk: row["sp_atk"].to_i,
    sp_def: row["sp_def"].to_i,
    speed: row["speed"].to_i
  })
end
