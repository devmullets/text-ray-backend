class GameUsersController < ApplicationController
    def index
        gameusers = GameUser.all.sort_by { |game| -game.score }
        render json: gameusers
      end
      
      def show
          gameuser = GameUser.find(params[:id])
          render json: gameuser
      end

      def create 
        gameuser = GameUser.create(game_user_params)
        render json: gameuser
      end

      def update
        gameuser = GameUser.find(params[:id])
    
        gameuser.update(game_user_params)
    
        render json: gameuser
      end

      private

      def game_user_params
        params.require(:game_user).permit(:user_id,:score, :game_id)
      end
end
