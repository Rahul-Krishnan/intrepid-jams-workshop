class GamesController < ApplicationController
  def index
    @games_data = Game.all
    @games = []
    @games_data.each do |game|
      @games << {"id" => game.id}
      competing_teams = []
      game.competing_teams.each do |team|
        competing_teams << {
          "id" => team.team_id,
          "name" => Team.find(team.team_id).name,
          "team" => team.score
      }
      end
      @games[game.id - 1].merge!("competing_teams" => competing_teams)
    end
    render json: @games, status: 200
  end
end
