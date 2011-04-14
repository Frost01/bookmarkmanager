class BookmarksController < ApplicationController
  verify :except => ["index","show"], 
    :session => :admin, 
    :add_flash => {:error => "Sie sind nicht angemeldet!"}, 
    :redirect_to => {:controller => "authentication", 
      :action => "login"}
  
  def index
    @bookmarks = Bookmark.find(:all)
  end

  def show
    @bookmark = Bookmark.find(params[:id])
    respond_to do |format|
      format.html
      format.xml {render :xml => @bookmark.to_xml}
    end
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @bookmark = Bookmark.new
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.update_attributes(params[:bookmark])
      flash[:notice] = "Favorit wurde erfolgreich geändert"
      redirect_to bookmarks_path
    else
      render :action => "edit"
    end
  end

  def create
    @bookmark = Bookmark.new(params[:bookmark])
    if @bookmark.save
      flash[:notice] = "Favorit wurde erfolgreich angelegt"
      redirect_to bookmarks_path
    else
      render :action => "new"
    end
  end
  
  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    flash[:notice] = "Favorit wurde erfolgreich gelöscht"
    redirect_to bookmarks_path
  end
  
end
