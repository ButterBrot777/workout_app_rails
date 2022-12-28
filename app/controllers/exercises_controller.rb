# frozen_string_literal: true

class ExercisesController < ApplicationController
  def index; end

  def new
    @exercise = current_user.exercises.new
  end

  def show
    @exercise = current_user.exercises.find_by(id: params[:id])
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

  def exercise_params
    params.require(:exercise).permit(:duration_in_min, :workout, :workout_date, :user_id)
  end
end
