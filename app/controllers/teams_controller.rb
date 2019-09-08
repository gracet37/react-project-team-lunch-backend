class TeamsController < ApplicationController

    def index
        @teams = Team.all
        render json: @teams#, include: [:users]
    end

    def create
        team = Team.new(team_params)
        if team.valid?
            render json: team
        else
            render json: {errors: team.errors.full_messages} 
        end
    end

    private

    def team_params
        params.require(:team).permit(:team_name)
    end
end
