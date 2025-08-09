class KittensController < ApplicationController
  before_action :set_kitten, only: [:show, :edit, :update, :destroy]

  def index
    @kittens = Kitten.all
  end

  def show
  end

  def new
    @kitten = Kitten.new
  end

  def edit
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      flash[:notice] = "You added a kitten! 🐱"
      redirect_to @kitten
    else
      flash.now[:alert] = "Oops! Something went wrong 😿"
      render :new
    end
  end

  def update
    if @kitten.update(kitten_params)
      flash[:notice] = "You updated a kitten! 😺"
      redirect_to @kitten
    else
      flash.now[:alert] = "Couldn't update kitten 😿"
      render :edit
    end
  end

  def destroy
    @kitten.destroy
    flash[:notice] = "You deleted a kitten! 💔"
    redirect_to kittens_path
  end

  private

  def set_kitten
    @kitten = Kitten.find(params[:id])
  end

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
