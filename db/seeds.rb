# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

player_one = Player.create(email: 'jannah@me.com', password: '12345678', password_confirmation: '12345678', fullname: 'Jannah Bee')

player_two = Player.create(email: 'hannah@me.com', password: '12345678', password_confirmation: '12345678', fullname: 'Hannah Pillar')

player_three = Player.create(email: 'ally@me.com', password: '12345678', password_confirmation: '12345678', fullname: 'Ally Mee')

player_four = Player.create(email: 'fred@me.com', password: '12345678', password_confirmation: '12345678', fullname: 'Fred Rice')

Offer.create(player_id: player_one.id, days_per_turn: 3, play_as: "Random", rated: 'Yes')

Offer.create(player_id: player_one.id, days_per_turn: 5, play_as: "White", rated: 'Yes')

Offer.create(player_id: player_one.id, days_per_turn: 7, play_as: "Black", rated: 'Yes')

Game.create(white_player: player_one.id, black_player: player_two.id)
