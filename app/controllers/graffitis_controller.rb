class GraffitisController < ApplicationController
  def new
    @title = "Graffiti page"
    @graffiti = Graffiti.new
  end

  def show
    @title = "Graffiti page"
    @graffiti = Graffiti.all
  end

  def index
    redirect_to new_graffiti_path
  end

  def create
    @graffiti = Graffiti.new(params[:graffiti])
    @graffiti.save
    redirect_to new_graffiti_path
  end

end
