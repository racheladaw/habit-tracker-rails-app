class HabitsController < ApplicationController
  before_action :require_login

  def new
    @habit = Habit.new(category_id: params[:category_id])
  end

  def create
    @habit = Habit.new(habit_params)
    if @habit.save
      redirect_to category_habits_path(@habit.category_id)
    else
      render :new
    end
  end

  def index
    @category = Category.find(params[:category_id])
    @habits = @category.habits
  end

  private

  def habit_params
    params.require(:habit).permit(:name, :category_id)
  end


end
