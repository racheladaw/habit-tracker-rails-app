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
    completion_date = CompletionDate.new(date: Time.now)
    if @goal.goal_completed_today?(completion_date.datetime_to_date)
      flash[:message] = "You have already completed this habit today!"
      redirect_to habit_goal_path(@goal.habit, @goal)
    else
      @goal.complete_goal_today
      completion_date.goal_id = @goal.id
      completion_date.save
      @goal.save
      redirect_to habit_goal_path(@goal.habit, @goal)
    end
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
