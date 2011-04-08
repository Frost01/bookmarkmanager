class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.find(:all)
  end

  def show
    @bookmark = Bookmark.find(params[:id])
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
      redirect_to :action => "index"
    else
      render :action => "edit"
    end
  end

  def create
    @bookmark = Bookmark.new(params[:bookmark])
    if @bookmark.save
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end
end
