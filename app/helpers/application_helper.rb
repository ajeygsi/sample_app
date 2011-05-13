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

  def use_tinymce
    @content_for_tinymce = "" 
    content_for :tinymce do
      javascript_include_tag "tiny_mce/tiny_mce"
    end
    @content_for_tinymce_init = "" 
    content_for :tinymce_init do
      javascript_include_tag "mce_editor"
    end
  end
end
