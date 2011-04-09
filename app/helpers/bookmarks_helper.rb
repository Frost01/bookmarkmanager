module BookmarksHelper
  def back_to_list
    content_tag(:div, link_to ("Zurück zur Liste", :action => "index"), :class => "subNavigation")
  end
  
  def german_time(time)
    time.strftime("%d.%m.%Y %H:%M")
  end
end
