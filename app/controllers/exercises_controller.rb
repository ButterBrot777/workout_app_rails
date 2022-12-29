# frozen_string_literal: true

class ExercisesController < ApplicationController
  def index
    @exercises = current_user.exercises
  end

  def new
    @exercise = current_user.exercises.new
  end

  def show
    @exercise = current_user.exercises.find_by(id: params[:id])
  end

  def edit
    @exercise = Exercise.find(params[:id])
  end

  def create
    @exercise = current_user.exercises.new(exercise_params)

    if @exercise.save
      flash[:notice] = 'Exercise has been created'
      redirect_to [current_user, @exercise]
    else
      flash.now[:alert] = 'Exercise failed to create'
      render :new
    end
  end

  def update
    @exercise = Exercise.find(params[:id])

    if @exercise.update(exercise_params)
      flash[:notice] = 'Exercise was updated'
    else
      flash[:alert] = 'Exercise failed to update'
    end
    redirect_to user_exercises_path(current_user)
  end

  def destroy
    @exercise = Exercise.find(params[:id])
    if @exercise.destroy
      flash[:notice] = 'Exercise was deleted'
      redirect_to user_exercises_path
    else
      flash[:alert] = 'Exercise failed to delete'
    end
  end

  private

  def exercise_params
    params.require(:exercise).permit(:duration_in_min, :workout, :workout_date, :user_id)
  end
end
