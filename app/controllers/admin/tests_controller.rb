class Admin::TestsController < Admin::BaseController
  before_action :find_test, only: %i[show destroy edit update]

  def index
    @tests = Test.all
  end

  def show; end

  def destroy
    @test.destroy

    redirect_to admin_tests_path
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)

    @test.author = current_user

    if @test.save
      redirect_to admin_test_path(@test)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to admin_test_path(@test)
    else
      render :edit
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