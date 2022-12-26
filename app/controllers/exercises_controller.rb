# frozen_string_literal: true

class ExercisesController < ApplicationController
  def index; end

  def new
    @exiercie = current_user.exercises.new
  end
end
