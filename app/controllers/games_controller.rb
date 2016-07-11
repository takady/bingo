class GamesController < ApplicationController
  before_action :set_game, only: [:show, :destroy]
  before_action :index_for_numbers, only: :show

  def index
    @games = Game.all
  end

  def show
    @index = index_for_numbers
    @number = @game.number_at(index_for_numbers)
    @character = @game.character_of(@number)
    @history = @game.history(0..index_for_numbers)
    @remaining_numbers = @game.remaining_numbers(index_for_numbers + 1)
  end

  def start
    @game = Game.start

    redirect_to @game
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

  def index_for_numbers
    params[:index].to_i.in?(0..Game::MAX_INDEX) ? params[:index].to_i : 0
  end
end
