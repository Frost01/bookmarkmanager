class AuthenticationController < ApplicationController
  def login
  end

  def logout
    reset_session
    flash[:notice] = "Sie wurden abgemeldet"
    redirect_to :controller => "bookmarks", :action => "index"
  end

  def check
    if params[:user] == "ich" && params[:password] =="geheim"
      session[:admin] = true
      flash[:notice] = "Erfolgreich angemeldet"
      redirect_to :controller => "bookmarks", :action => "index"
    else
      reset_session
      flash[:notice] = "Fehler bei der Anmeldung"
      redirect_to :controller => "authentication", :action => "login"
    end
  end
end
