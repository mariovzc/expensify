class DashboardController < ApplicationController
  def index
    @title = 'Dashboard'
    @tab = :dashboard
  end
end
