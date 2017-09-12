class Team < ActiveRecord::Base
  has_many :competing_teams
  has_many :players

  validates :name, presence: true, uniqueness: true
end
