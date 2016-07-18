class GamesController < ApplicationController
  before_action :set_game, only: :show
  before_action :index_for_numbers, only: :show

  def index
    @games = Game.all
  end

  def show
    @index = index_for_numbers
    @number = @game.number_at(@index)
  end

  def start
    @game = Game.start

    redirect_to @game
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def index_for_numbers
    params[:index].to_i.in?(0..Game::MAX_INDEX) ? params[:index].to_i : 0
  end
end
