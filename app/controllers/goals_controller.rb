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
    @goal = find_goal
  end

  def edit
    @goal = find_goal
  end

  def update
    @goal = find_goal
    @goal.update(goal_params)
    redirect_to goals_path
  end

  def completed_habit
    @goal = find_goal
    if @goal.goal_completed_today?(date_today)
      flash[:message] = "You have already completed this habit today!"
      redirect_to habit_goal_path(@goal.habit, @goal)
    else
      @goal.complete_goal_today
      redirect_to habit_goal_path(@goal.habit, @goal)
    end
  end

  def destroy
    find_goal.destroy
    redirect_to goals_path
  end

  private

  def goal_params
    params.require(:goal).permit(:description, :user_id, :habit_id, :start_date)
  end

  def date_today
    Time.now.localtime.to_date
  end

  def find_goal
    Goal.find(params[:id])
  end


end
