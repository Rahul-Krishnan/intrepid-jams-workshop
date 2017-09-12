class TeamsController < ApplicationController
  def index
    teams = Team.all
    render json: teams, :except => [:created_at, :updated_at], status: 200
  end

  def show
    team_data = Team.find(params[:id])
    player_data = Player.where(team: team_data)
    game_data = CompetingTeam.where(team: team_data)

    @players = []
    player_data.each do |player|
      @players << {
        id: player.id,
        first_name: player.first_name,
        last_name: player.last_name,
        jersey_number: player.jersey_number
      }
    end

    @games = []
    game_data.each do |game|
      opp_team_choices = CompetingTeam.where(game: game)
      opp_team = opp_team_choices.select { |team| team.team_id != team_data.id }
      @games << {
        id: game.id,
        score: game.score,
        opposing_team_name: Team.find(opp_team[0].team_id).name,
        opposing_team_score: CompetingTeam.where(team_id: opp_team[0].team_id)[0].score
      }
    end

    @team = {
        id: team_data.id,
        name: team_data.name,
        players: @players,
        games: @games
      }
    render :json => { :team => @team }, status: 200
  end
end
