module ApplicationHelper
  def admin?
    session[:admin] == true
  end
end
