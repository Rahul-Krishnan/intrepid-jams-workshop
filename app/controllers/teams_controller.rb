class TeamsController < ApplicationController
  def index
    teams = Team.all
    render json: teams, status: 200
  end

  def show
    team = Team.find(params[:id])
    render json: team, status: 200
  end
end
