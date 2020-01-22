class Admin::BadgesController < Admin::BaseController
  before_action :set_badges, only: %i[index update_inline]
  before_action :find_badge, only: %i[destroy edit update update_inline]

  def index; end

  def destroy
    @badge.destroy

    redirect_to admin_badges_path, notice: t('.success')
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to admin_badges_path, notice: t('.success')
    else
      render :new
    end
  end

  def edit; end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badges_path, notice: t('.success')
    else
      render :edit
    end
  end

  def update_inline
    if @badge.update(badge_params)
      redirect_to admin_badges_path, notice: t('.success')
    else
      render :index
    end
  end

  private

  def set_badges
    @badges = Badge.all
  end

  def find_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:title, :image, :condition, :target)
  end
end
