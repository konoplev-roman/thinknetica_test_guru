class AchievementsController < ApplicationController
  before_action :authenticate_user!

  def index
    @achievements = current_user.achievements.order(created_at: :desc)
    @badges = Badge.all
  end
end
