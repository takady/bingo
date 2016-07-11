class GamesController < ApplicationController
  before_action :set_game, only: [:show, :destroy]

  def index
    @games = Game.all
  end

  def show
  end

  def start
    @game = Game.start
    @numbers = @game.numbers.split(',')
  end

  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end
end
