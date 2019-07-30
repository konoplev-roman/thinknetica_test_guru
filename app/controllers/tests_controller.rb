class TestsController < ApplicationController
  before_action :find_test, only: %i[show destroy]

  def index
    @tests = Test.all
  end

  def show; end

  def destroy
    @test.destroy

    redirect_to tests_path
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end
end
