# frozen_string_literal: true

class DashboardsController < ApplicationController
  before_action :authenticate_user!, except: %i[index]

  def index; end
end
