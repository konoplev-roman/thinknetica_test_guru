class TestsController < ApplicationController
  before_action :find_test, only: %i[show destroy edit update]

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

    render '_form'
  end

  def create
    @test = Test.new(test_params)

    @test.author = User.all.sample

    if @test.save
      redirect_to test_path(@test)
    else
      render '_form'
    end
  end

  def edit
    render '_form'
  end

  def update
    if @test.update(test_params)
      redirect_to test_path(@test)
    else
      render '_form'
    end
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :category_id, :level)
  end
end
