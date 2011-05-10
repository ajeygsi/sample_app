module ApplicationHelper

  # Return a title on a per-page basis.
  
  def title
    base_title = "Ruby on rails tutorial sample app"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

  # logo helper.
  def logo
    logo = image_tag("logo.png", :alt => "Sample App", :class => "round") 

  end
end
