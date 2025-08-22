class KittensController < ApplicationController
  def index
    @kittens = Kitten.all

    respond_to do |format|
      format.html
      format.json { render json: @kittens }
    end
  end

  def show
    @kitten = Kitten.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @kitten }
    end
  end

  def new
    @kitten = Kitten.new
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def create
    @kitten = Kitten.new(kitten_params)

    if @kitten.save
      flash[:success] = "The #{@kitten.name} has been successfully created."
      redirect_to kitten_path(@kitten)
    else
      flash[:error] = "The #{@kitten.name} has not been created, try again."
      redirect_to :new
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy if @kitten.persisted?
    if @kitten.destroyed?
      flash[:notice] = "#{@kitten.name} has been successfully deleted."
      redirect_to root_path
    else
      redirect_to @kitten, error: "An Error occurred, try again."
    end
  end

  def update
    @kitten = Kitten.find(params[:id])
    if @kitten.update(kitten_params)
      redirect_to @kitten, notice: "#{@kitten.name} has been successfully updated."
    else
      redirect_to @kitten, error: "An Error occurred, try again."
    end
  end

  private

  def kitten_params
    params.expect(kitten: [ :name, :age, :cuteness, :softness ])
  end
end
