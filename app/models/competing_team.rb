class CompetingTeam < ActiveRecord::Base
  belongs_to :game
  belongs_to :team

  validates :score, presence: true
end
