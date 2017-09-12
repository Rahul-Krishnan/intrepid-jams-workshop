games = [{ competing_teams: [{ name: 'Bulls', players: [{first_name: 'Danny', last_name: 'Devito', jersey_number: 12}, {first_name: 'Jimminny', last_name: 'Cricket', jersey_number: 1}], score: 812 },
                   { name: 'Spurs', players: [{first_name: 'Logan', last_name: 'Lucky', jersey_number: 9 }, {first_name: 'Ben', last_name: 'Grimm', jersey_number: 4 }], score: 56 }] },
         { competing_teams: [{ name: 'Celtics', players: [{first_name: 'Boom', last_name: 'Shakalaka', jersey_number: 91 }, {first_name: 'Susie', last_name: 'Queue', jersey_number: 14 }],  score: 34 },
                   { name: 'Spurs', players: [{first_name: 'Rachel', last_name: 'Maddow', jersey_number: 23 }, {first_name: 'Helen', last_name: 'Keller', jersey_number: 24 }], score: 10000 }] },
         { competing_teams: [{ name: 'Lakers', players: [{first_name: 'Nick', last_name: 'Fury', jersey_number: 33 }, {first_name: 'Stan', last_name: 'Theman', jersey_number: 43 }], score: 92 },
                   { name: 'Knicks', players: [{first_name: 'Bryant', last_name: 'Cowbee', jersey_number: 3 }, {first_name: 'Status', last_name: 'Updayt', jersey_number: 92 }], score: 786 }] }]

puts 'Seeding 3 games...'

games.each do |game_attrs|
  game = Game.create
  game_attrs[:competing_teams].each do |team_attrs|
    team = Team.find_or_create_by(name: team_attrs[:name])
    team.save
    competing = CompetingTeam.new
    competing.score = team_attrs[:score]
    competing.team = team
    competing.game = game
    competing.save
    team_attrs[:players].each do |player_attrs|
      player = Player.new
      player.first_name = player_attrs[:first_name]
      player.last_name = player_attrs[:last_name]
      player.jersey_number = player_attrs[:jersey_number]
      player.team = team
      player.save
    end
  end
end

puts 'Done.'
