class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test, only: %i[show destroy edit update start]
  before_action :find_user, only: %i[create start]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_not_found

  def index
    @tests = Test.all
  end

  def show; end

  def destroy
    @test.destroy

    redirect_to tests_path
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)

    @test.author = @user

    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def start
    @user.tests.push(@test)

    redirect_to @user.passed_test(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def find_user
    @user = User.all.sample
  end

  def test_params
    params.require(:test).permit(:title, :category_id, :level)
  end

  def rescue_with_not_found
    render plain: 'Record was not found!!!'
  end
end
