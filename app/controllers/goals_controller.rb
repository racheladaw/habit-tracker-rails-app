class GoalsController < ApplicationController
  before_action :require_login

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

  def show
    @goal = Goal.find(params[:id])
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])
    @goal.update(goal_params)
    redirect_to goals_path
  end

  def completed_habit
    @goal = Goal.find(params[:id])
    @goal.days_completed += 1
    @goal.save
    redirect_to habit_goal_path(@goal.habit, @goal)
  end

  def destroy
    Goal.find(params[:id]).destroy
    redirect_to goals_path
  end

  private

  def goal_params
    params.require(:goal).permit(:description, :user_id, :habit_id, :start_date)
  end


end
