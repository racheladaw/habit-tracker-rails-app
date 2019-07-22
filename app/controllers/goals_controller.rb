class GoalsController < ApplicationController


  def new
    @goal = Goal.new(habit_id: params[:habit_id])
  end

  def create
    @goal = Goal.new(goal_params)
    if @goal.save
      redirect_to goals_path
    else
      render :new
    end
  end

  def index
    @goals = current_user.goals
  end

  private

  def goal_params
    params.require(:goal).permit(:description, :user_id, :habit_id)
  end


end
