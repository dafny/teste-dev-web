class DogsController < ApplicationController
  before_action :set_dog, only: :show

  def index
    @dogs = Dog.search(params[:search])
  end

  def show
  end

  private
    def set_dog
      @dog = Dog.find_by(id: params[:id])
    end

end
