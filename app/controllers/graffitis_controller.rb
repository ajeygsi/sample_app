class GraffitisController < ApplicationController
uses_tiny_mce :options => {
                            :theme => 'advanced',
                            :theme_advanced_resizing => true,
                            :theme_advanced_resize_horizontal => false,
                            :plugins => %w{ table fullscreen }
                          }

  def new
    @title = "Graffiti page"
    @graffiti = Graffiti.new
    @writings = Graffiti.all
  end

  def show
    @title = "Graffiti page"
    @graffiti = Graffiti.all
  end

  def index
    redirect_to new_graffiti_path
  end

  # def create
  #   @received_params = params[:graffiti]
  # end

  def create
    @graffiti = Graffiti.new(params[:graffiti])
    @graffiti.save
    redirect_to new_graffiti_path
  end

end
