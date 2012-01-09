module ApplicationHelper
 # Return a title on a per-page basis.
  def title
    base_title = "Thrill Engine - The Adventure Finder"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
 def logo
    image_tag("flo3.png", :alt => "N", :class => "round")
  end
  
end
